# Dockerized GitHub CLI

A lightweight Alpine-based container for the upstream [GitHub CLI (`gh`)](https://cli.github.com/), useful for running GitHub operations inside CI and containerized build environments.

[![Docker Hub](https://dockeri.co/image/maniator/gh)](https://hub.docker.com/r/maniator/gh/)

- **Source:** https://github.com/maniator/gh
- **Images and tags:** https://hub.docker.com/r/maniator/gh/tags/
- **Security policy:** [SECURITY.md](./SECURITY.md)
- **Downstream usage and version-pin inventory:** [downstream-usage-report.md](./downstream-usage-report.md)

## Docker image tags

The [tagging script](./hooks/scripts/set_tags) and [release workflows](./.github/workflows/docker-build.yml) define the current publication policy:

| Tag | Update behavior |
|---|---|
| `latest` | Current stable upstream `gh` release; rolling with successful scheduled builds. |
| `v2` (rolling major) | Newest `gh` v2 release; intended as a rolling v2 line while upstream major v2 is current. |
| `v2.95` (rolling major.minor) | Refreshed **only while v2.95 is the newest upstream minor line**. When `gh` moves to v2.96, the old `v2.95` line stops receiving scheduled refreshes. |
| `v2.95.0` (exact release) | Usually left unchanged after first publication, **except** that the three newest stable exact releases are explicitly rebuilt on the patched base by a [weekly job](./.github/workflows/refresh-recent-tags.yml). Older exact tags remain frozen by default. |
| `vX.Y.Z@sha256:...` (digest pin) | Immutable image content; requires deliberate updates to receive newer binaries or OS package fixes. |

These names are **examples of the tag scheme**, not a statement that a particular release is the latest today. Check Docker Hub for currently published tags. Registry tags moving **does not** update already running containers or prevent cached image reuse: repull/redeploy when updates are desired. For security considerations see [SECURITY.md](./SECURITY.md).

## Docker usage

Set a GitHub token in the local environment and pass it through to the container. `gh` recognizes `GH_TOKEN` (and `GITHUB_TOKEN`); using `-e GH_TOKEN` avoids placing its actual value in the command arguments.

```sh
export GH_TOKEN="your-github-token"
docker run --rm -it \
  -e GH_TOKEN \
  -v "${PWD}:/gh" \
  maniator/gh:latest \
  repo view maniator/gh
```

Only mount the work directory or configuration files the container actually needs. Mounting all of `${HOME}` to `/root` grants the container access to unrelated credentials and files.

Optional shell alias:

```sh
alias gh='docker run --rm -it -e GH_TOKEN -v "${PWD}:/gh" maniator/gh:latest'

gh repo clone maniator/gh
```

The alias expects `GH_TOKEN` to be set in your environment for authenticated commands. Some operations on public repositories may work without authentication.

## Kubernetes initContainer example

The following example clones a repository into a shared `emptyDir` volume during pod initialization. Replace `username/theme` with the desired repository and create the Kubernetes Secret `github-credentials` with a `token` key before running this example. Prefer a narrowly scoped credential and appropriate service-account permissions.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: gh-clone-example
spec:
  restartPolicy: Never
  initContainers:
    - name: clone
      image: maniator/gh:v2
      command: ["gh"]
      args: ["repo", "clone", "username/theme", "/gh/theme"]
      env:
        - name: GH_TOKEN
          valueFrom:
            secretKeyRef:
              name: github-credentials
              key: token
      volumeMounts:
        - name: repo
          mountPath: /gh
  containers:
    - name: consumer
      image: alpine:3.24.1
      command: ["sh", "-c", "ls -la /workspace/theme"]
      volumeMounts:
        - name: repo
          mountPath: /workspace
  volumes:
    - name: repo
      emptyDir: {}
```

If reproducible deployment is critical, pin a digest and manage explicit image upgrades instead of relying on `latest` or another moving tag.
