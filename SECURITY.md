# Security Policy

## Reporting a vulnerability

Please report security issues via a [private GitHub security advisory](https://github.com/maniator/gh/security/advisories/new), or open an issue for non-sensitive reports.

## How this image is hardened

`maniator/gh` is a thin wrapper that ships the upstream [GitHub CLI](https://github.com/cli/cli) (`gh`) binary on Alpine. To keep it patched:

- The Alpine base is kept current and `apk upgrade --no-cache` runs on **every** build, pulling OS security patches even when no version bump is involved.
- `latest` and the rolling `vMAJOR` / `vMAJOR.MINOR` tags (e.g. `v2`, `v2.95`) are rebuilt **nightly** on the freshly-patched base. Pin a rolling tag to keep receiving patches; see the [README](./README.md#docker-image-tags).
- Exact `vX.Y.Z` tags are immutable; the most recent few are periodically refreshed for security.
- CI runs **Trivy** on every PR and weekly, gating builds on fixable **OS-package** CVEs (`hadolint` and `shellcheck` run too).

## Known / accepted residual findings

Some scanner findings originate in **upstream components we do not build** (the `gh` binary) or in **OS packages with no released fix**. We cannot patch these in this repository; they are tracked here and re-evaluated as upstream ships fixes — which the nightly `apk upgrade` rebuild then picks up automatically.

| CVE | Severity | Component | Status | Notes |
|-----|----------|-----------|--------|-------|
| [CVE-2025-15558](https://osv.dev/vulnerability/CVE-2025-15558) | High | `github.com/docker/cli`, compiled into the upstream `gh` binary | **Not affected (Linux)** | Windows-only privilege escalation via `C:\ProgramData\Docker\cli-plugins`; that path does not exist on these `linux/*` images, so the vulnerable code is not in the execute path. Asserted in [`openvex.json`](./openvex.json). Fixed upstream in `docker/cli` ≥ 29.2.0; the scanner finding clears when `gh` ships a release bumping its vendored `docker/cli`. |
| [CVE-2025-60876](https://security.alpinelinux.org/srcpkg/busybox) | Medium | `alpine/busybox` | **Affected — no upstream fix** | BusyBox `wget` request-splitting. No fixed `busybox` exists in any Alpine branch yet (incl. edge) — `apk upgrade` already pulls the newest available. Not exercised at runtime by a `gh` container. Auto-clears via the nightly rebuild once Alpine publishes a patch. |

_Last reviewed: 2026-06-19._

### Consuming the VEX

Scanners that support [OpenVEX](https://openvex.dev) can suppress the not-affected finding above:

```sh
trivy image --vex openvex.json maniator/gh:latest
```
