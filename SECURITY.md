# Security policy

## Reporting a vulnerability

Please use a [private GitHub security advisory](https://github.com/maniator/gh/security/advisories/new) to report potential security vulnerabilities. **Do not disclose exploit details, credentials, or private findings in a public issue.** Ordinary non-sensitive bugs and documentation errors can be filed in [GitHub Issues](https://github.com/maniator/gh/issues).

This project publishes a container image wrapping the upstream [GitHub CLI](https://github.com/cli/cli). When reporting a suspected issue, identify the affected image tag or digest, platform/architecture, and reproduction details privately where possible.

## Image update and support behavior

These statements reflect the workflows and scripts in this repository, reviewed **2026-10-14**. They describe what the automation is configured to do, not a guarantee that a specific registry tag has been rebuilt successfully or that a particular issue is fixed.

- The Dockerfile builds on Alpine (currently `alpine:3.24.1`) and runs `apk upgrade --no-cache` in **both build stages**. A new build can pick up then-available Alpine package fixes.
- [Build and Release](./.github/workflows/docker-build.yml) is scheduled **daily**, and publishes current rolling image tags when a build succeeds; additional builds run on pushes and manual dispatch. Upstream `gh` release resolution is implemented in [`hooks/scripts/set_tags`](./hooks/scripts/set_tags).
- **`latest`** and the rolling major tag (e.g. **`v2`**) track the current upstream `gh` release and are rebuilt by the regular pipeline. **`vMAJOR.MINOR`** (e.g. `v2.95`) is a rolling tag **only while that minor version is the latest upstream release line**. When upstream moves to a later minor, the older minor tag is no longer refreshed by the daily workflow. Do not treat an old minor tag as an indefinitely patched release channel.
- **Exact `vX.Y.Z` tags** are left unchanged **by default**; an exception is the [weekly refresh job](./.github/workflows/refresh-recent-tags.yml), which rebuilds the **three most recent upstream stable releases** by default, republishing their exact tags on the updated base. The count can be changed by manual dispatch. Older exact tags do not get automatic fixes.
- An image already pulled or running does **not** update itself when the registry tag changes. Consumers must repull/redeploy (subject to their deployment system and pull policy). For reproducibility and supply-chain control, prefer **digest pinning** and deliberate review of updates; digest-pinned images do not auto-update.
- [Trivy](./.github/workflows/trivy.yml) runs on pull requests, on a **weekly** schedule, and by manual dispatch. A HIGH/CRITICAL scan of all fixable package types is **informational**; an additional HIGH/CRITICAL fixable **OS-package-only** check is a failing gate. [Hadolint](./.github/workflows/hadolint.yml) and [ShellCheck](./.github/workflows/shell-check.yml) are configured separately. A passing gate does **not** prove absence of vulnerabilities.
- The [downstream usage report](./downstream-usage-report.md) describes publicly observable image references, **not** verified CVE exposure or which deployments have received an update.

## Historical assessed findings (not a fresh vulnerability scan)

The following were assessed on **2026-06-19**. Their current status **has not been revalidated as part of the 2026-10-14 documentation audit**; use recent Trivy output, upstream advisories, Alpine security notices, and the image digest under investigation before drawing current vulnerability conclusions.

| CVE | 2026-06-19 assessment | Relevant component | Follow-up |
|---|---|---|---|
| [CVE-2025-15558](https://osv.dev/vulnerability/CVE-2025-15558) | Not affected on Linux; Windows-specific Docker CLI plugin lookup | `github.com/docker/cli` within the upstream `gh` binary | Historical assessment is encoded in [`openvex.json`](./openvex.json). Revalidate if upstream changes or a scanner disputes applicability. |
| [CVE-2025-60876](https://security.alpinelinux.org/srcpkg/busybox) | Affected package; no upstream fix available **at that time** | Alpine BusyBox / `wget` | Check Alpine's **current** fix status and runtime reachability; do not assume the June determination remains current. |

The project cannot patch vulnerabilities in the prebuilt upstream `gh` binary in this repository without moving to a patched upstream release. OS package findings depend on Alpine's available fixes. Both require rechecking the actually published image rather than extrapolating from an old report.

### Using the VEX statement

Where supported, scan consumers can supply the published [OpenVEX](https://openvex.dev) statement:

```sh
trivy image --vex openvex.json maniator/gh:latest
```

The statement records a *specific historical applicability assessment*, not an assurance that every current scanner finding is harmless or fixed.
