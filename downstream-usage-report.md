# Downstream usage of `maniator/gh` — vulnerability exposure report

Generated from a `gh search code "maniator/gh"` sweep of **public** GitHub repos (default branches
only). GitHub's code-search API caps results (~100 per query / ~1000 total, rate-limited), so this
is a **representative sample, not a complete census**. The image has ~624k Docker Hub pulls, so real
usage is far larger than what is indexed here.

## How exposure is fixed

- **`:latest` / untagged consumers** → automatically protected once the patched `latest` is published
  (Alpine `3.24.1` + `apk upgrade`). **No action required on their side.**
- **Consumers pinning a recent `:vX.Y.Z` tag** → the most recent few releases are **rebuilt on the
  patched base** (a deliberate, opt-in security refresh via `REBUILD_EXACT=1`, driven by
  `hooks/scripts/rebuild_recent`). These tags are on Alpine 3.21, so the patch is a small, low-risk
  bump and recent pins get fixed in place with no change on the consumer's side.
- **Consumers pinning an OLD `:vX.Y.Z` tag** → we deliberately **leave these frozen**. Silently
  rebuilding `v2.10.1` (Alpine 3.15) onto Alpine 3.24 is a major-OS jump that could break setups
  pinned for reproducibility (newer musl/git, different package set). Instead we publish **opt-in
  rolling tags** — `vMAJOR` / `vMAJOR.MINOR` (e.g. `v2`, `v2.95`) — that always point at the latest
  patched build, so anyone who wants patches can switch their pin without us rewriting frozen history.

> Note: we deliberately do **not** open PRs against third-party consumer repos — unsolicited mass PRs
> are out of scope. Patching `latest`/rolling tags protects consumers without touching their code.

## Consumers pinning OLD version tags (vulnerable until the tag is rebuilt)

| Repo | Pinned tag |
|------|-----------|
| myspotontheweb/argocd-springboot-demo2 | v2.29.0 |
| Alexey-T/lexer_tests | v2.40.1 |
| Sir-NoChill/pkl-rust | v2.40.1 |
| gian-didom/pkl-lang-ssh | v2.40.1 |
| kdeps/schema | v2.40.1 |
| tenantcloud/laravel-better-cache | v2.48.0 |
| tenantcloud/laravel-boolean-softdeletes | v2.48.0 |
| tenantcloud/laravel-graphql-platform | v2.48.0 |
| mock-server/mockserver-monorepo | v2.62.0 |
| syncloud/image | v2.65.0 |
| quartz-technology/dagger-agents | v2.68.1 |
| aperture-sci/DevOps | v2.76.0 |
| fx-integral/academia-archives | v2.79.0 |
| tensorplex-labs/dojo | v2.79.0 |
| PingCAP-QE/ci | v2.83.2 |
| bccalegari/dev-link-iac | v2.83.2 |
| britter/gh-get | v2.92.0 |

**Distinct old tags to rebuild on the patched base:**
`v2.29.0 v2.40.1 v2.48.0 v2.62.0 v2.65.0 v2.68.1 v2.76.0 v2.79.0 v2.83.2 v2.92.0`
(plus `v2.10.1`, the prior Dockerfile default).

## Tag pull-recency (Docker Hub `tag_last_pulled`)

Docker Hub's public tags API exposes a `tag_last_pulled` timestamp per tag (but **not** a per-tag
pull *count* — only the repo-wide total of ~624k). Pulling that data for the rebuild-candidate tags:

| Tag | Last pulled | Last pushed | Note |
|-----|-------------|-------------|------|
| v2.10.1 | 2026-06-19 | 2022-10-28 | still pulled today, 3.5 yrs after push |
| v2.29.0 | — | — | **not published to the registry** — downstream pin is already broken |
| v2.40.1 | 2026-06-19 | 2024-01-08 | active |
| v2.48.0 | 2026-06-19 | 2024-04-30 | most-recently-pulled tag in the whole repo |
| v2.62.0 | 2026-06-19 | 2024-11-27 | active |
| v2.65.0 | 2026-06-19 | 2025-01-29 | active |
| v2.68.1 | 2026-06-19 | 2025-03-19 | active |
| v2.76.0 | 2026-06-19 | 2025-07-23 | active |
| v2.79.0 | 2026-06-19 | 2025-09-23 | active |
| v2.83.2 | 2026-06-19 | 2026-01-14 | active |
| v2.92.0 | 2026-06-19 | 2026-05-27 | active |

**Finding:** across all 96 published tags, virtually every historical tag was pulled within the last
day — old pins are genuinely live, so the exposure is real. The fix is tiered: the most recent few
exact tags get an in-place **patched rebuild** (low-risk, they're on Alpine 3.21); the patched
`latest`/`v2`/`v2.95` rolling lines move forward for everyone else; and old exact pins stay **frozen**
as their authors intended. (Caveat: `tag_last_pulled` counts any pull — CI, scanners, registry
mirrors, our own tests — so it proves "still in use" but can't rank tags by volume.)

## Consumers on `:latest` or untagged (auto-fixed, no action needed)

4min/resume · CircleCI-Public/circleci-server-monitoring-reference ·
CircleCI-Public/container-runner-helm-chart · ClawGym/ClawGym-Agents · DursunKm/docker-dev-tools ·
InnovatorLM/Innovator-VL · Jackie2049/prefix-0501 · JoyboySol/Megatron-LM · MansonBruv/capstone ·
Miya-315/7608_LLM · NVIDIA/Megatron-LM · PingCAP-QE/ci · Sphere-AI-Lab/pion · aperture-sci/DevOps ·
buegelbeatz/tsp-quantum · containifyci/engine-ci · dumasd/config-ops · dylanyunlon/Neuron_SP ·
fhdsl/capstone-sandbox · geekittime/evoclaw · hotosm/docs ·
kubiya-solutions-engineering/developer-onboarding · kubiya-solutions-engineering/hackathon-tools ·
kubiyabot/community-tools · minvws/nl-rdo-woo-web · mock-server/mockserver-monorepo ·
mohsen-deriv/action-create-pull-request-another-repo · shanearcaro/automatic-labeler ·
shushuzn/workspace · zhejianglab/Gengram
