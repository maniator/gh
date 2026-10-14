# Downstream project popularity appendix (2026-10-14)

This is a companion to [the downstream image-reference report](./downstream-usage-report.md). All **93** repositories in that report were queried individually through the GitHub repository API for `stargazers_count`, `forks_count`, and `pushed_at` on **2026-10-14**. Values are an as-of snapshot; they change over time. The separately discovered `cidx` security-document reference is included.

**Interpretation:** A repository's stars/forks measure interest in that repository, **not** users, downloads, execution or adoption of the `maniator/gh` image. A last-push date can reflect unrelated code. Some references are copied/vendored CI files or sample documentation. The reference class follows the mutually exclusive classification in the main report, not a measured runtime/version distribution. GitHub's `pushed_at` is not the date this particular image reference changed.

## Distribution

- **93** documented public repository references with directly queried GitHub metadata (one GitHub repo counted once, irrespective of match count).
- **51** have 0 stars; **24** have 1–9; **13** have 10–99; **5** have 100+ stars. Median star count: **0**.
- **71 of 93** had a GitHub `pushed_at` date on or after 2025-10-14; this is repository activity, not evidence that the `maniator/gh` reference is used.
- Largest star counts: [NVIDIA/Megatron-LM](https://github.com/NVIDIA/Megatron-LM) (18,151); [mock-server/mockserver-monorepo](https://github.com/mock-server/mockserver-monorepo) (4,989); [zgcagi/ZGCM-1](https://github.com/zgcagi/ZGCM-1) (625); [InnovatorLM/Innovator-VL](https://github.com/InnovatorLM/Innovator-VL) (172); [MuyeHuang/DuplexOmni](https://github.com/MuyeHuang/DuplexOmni) (129).


## All repositories

Sorted by **stars (descending)**, then **forks (descending)**, then repository name (ascending).

| Public repository | Reference class | Stars | Forks | Last push (UTC date) |
|---|---|---:|---:|---|
| [`NVIDIA/Megatron-LM`](https://github.com/NVIDIA/Megatron-LM) | `Untagged/other` | 18151 | 4626 | 2026-10-14 |
| [`mock-server/mockserver-monorepo`](https://github.com/mock-server/mockserver-monorepo) | `v2.62.0` | 4989 | 1116 | 2026-10-14 |
| [`zgcagi/ZGCM-1`](https://github.com/zgcagi/ZGCM-1) | `Untagged/other` | 625 | 83 | 2026-10-03 |
| [`InnovatorLM/Innovator-VL`](https://github.com/InnovatorLM/Innovator-VL) | `Untagged/other` | 172 | 12 | 2026-03-20 |
| [`MuyeHuang/DuplexOmni`](https://github.com/MuyeHuang/DuplexOmni) | `Untagged/other` | 129 | 14 | 2026-07-26 |
| [`one2piece2hello/faibench_Frontier_InfraBench`](https://github.com/one2piece2hello/faibench_Frontier_InfraBench) | `Untagged/other` | 68 | 3 | 2026-10-13 |
| [`zhejianglab/Gengram`](https://github.com/zhejianglab/Gengram) | `Untagged/other` | 50 | 4 | 2026-03-17 |
| [`dylanyunlon/Neuron_SP`](https://github.com/dylanyunlon/Neuron_SP) | `Untagged/other` | 49 | 47 | 2026-09-21 |
| [`ClawGym/ClawGym-Agents`](https://github.com/ClawGym/ClawGym-Agents) | `Untagged/other` | 44 | 3 | 2026-06-30 |
| [`Sphere-AI-Lab/pion`](https://github.com/Sphere-AI-Lab/pion) | `Untagged/other` | 40 | 2 | 2026-09-25 |
| [`tenantcloud/laravel-boolean-softdeletes`](https://github.com/tenantcloud/laravel-boolean-softdeletes) | `v2.48.0` | 27 | 17 | 2025-06-27 |
| [`PingCAP-QE/ci`](https://github.com/PingCAP-QE/ci) | `v2.100.0` | 20 | 117 | 2026-10-14 |
| [`cuhk-parser/PARSER`](https://github.com/cuhk-parser/PARSER) | `Untagged/other` | 16 | 1 | 2026-09-13 |
| [`wmglab-duke/pyfibers`](https://github.com/wmglab-duke/pyfibers) | `:latest` | 15 | 3 | 2026-10-13 |
| [`syncloud/image`](https://github.com/syncloud/image) | `v2.65.0` | 12 | 3 | 2026-10-11 |
| [`CircleCI-Public/container-runner-helm-chart`](https://github.com/CircleCI-Public/container-runner-helm-chart) | `:latest` | 11 | 14 | 2026-10-13 |
| [`myspotontheweb/argocd-springboot-demo2`](https://github.com/myspotontheweb/argocd-springboot-demo2) | `v2.29.0` | 11 | 1 | 2025-10-24 |
| [`britter/gh-get`](https://github.com/britter/gh-get) | `v2.102.0` | 10 | 0 | 2026-10-12 |
| [`containifyci/engine-ci`](https://github.com/containifyci/engine-ci) | `Untagged/other` | 8 | 1 | 2026-10-12 |
| [`Jackie2049/PrefixSharing`](https://github.com/Jackie2049/PrefixSharing) | `Untagged/other` | 7 | 1 | 2026-08-17 |
| [`hotosm/docs`](https://github.com/hotosm/docs) | `Untagged/other` | 6 | 2 | 2026-10-14 |
| [`kubiyabot/community-tools`](https://github.com/kubiyabot/community-tools) | `:latest` | 5 | 6 | 2025-12-18 |
| [`tenantcloud/laravel-better-cache`](https://github.com/tenantcloud/laravel-better-cache) | `v2.48.0` | 5 | 0 | 2025-06-28 |
| [`Zhongxieye/OpenClaw-RL`](https://github.com/Zhongxieye/OpenClaw-RL) | `Untagged/other` | 5 | 0 | 2026-03-20 |
| [`tenantcloud/php-data-transfer-objects`](https://github.com/tenantcloud/php-data-transfer-objects) | `v2.48.0` | 4 | 1 | 2025-07-02 |
| [`Sir-NoChill/pkl-rust`](https://github.com/Sir-NoChill/pkl-rust) | `v2.40.1` | 3 | 1 | 2024-06-27 |
| [`Alexey-T/lexer_tests`](https://github.com/Alexey-T/lexer_tests) | `v2.40.1` | 3 | 0 | 2026-10-06 |
| [`tenantcloud/laravel-command-logger`](https://github.com/tenantcloud/laravel-command-logger) | `v2.48.0` | 2 | 1 | 2025-07-03 |
| [`tenantcloud/php-standard`](https://github.com/tenantcloud/php-standard) | `v2.48.0` | 2 | 1 | 2026-04-11 |
| [`datologyai/Megatron-LM-zephon`](https://github.com/datologyai/Megatron-LM-zephon) | `Untagged/other` | 2 | 0 | 2026-10-13 |
| [`gosh-sh/bridge`](https://github.com/gosh-sh/bridge) | `Untagged/other` | 2 | 0 | 2026-10-14 |
| [`tenantcloud/laravel-graphql-platform`](https://github.com/tenantcloud/laravel-graphql-platform) | `v2.48.0` | 2 | 0 | 2026-01-26 |
| [`tenantcloud/laravel-json-api`](https://github.com/tenantcloud/laravel-json-api) | `v2.48.0` | 2 | 0 | 2026-08-17 |
| [`tenantcloud/php-rentler-sdk`](https://github.com/tenantcloud/php-rentler-sdk) | `v2.48.0` | 2 | 0 | 2026-04-11 |
| [`ZhangFanYi/ZhangFanYi.github.io`](https://github.com/ZhangFanYi/ZhangFanYi.github.io) | `Untagged/other` | 2 | 0 | 2026-08-22 |
| [`fominfo/resume`](https://github.com/fominfo/resume) | `Untagged/other` | 1 | 2 | 2026-09-30 |
| [`tenantcloud/laravel-cors`](https://github.com/tenantcloud/laravel-cors) | `v2.48.0` | 1 | 1 | 2025-07-03 |
| [`kdeps/schema`](https://github.com/kdeps/schema) | `v2.40.1` | 1 | 0 | 2026-01-10 |
| [`MansonBruv/capstone`](https://github.com/MansonBruv/capstone) | `Untagged/other` | 1 | 0 | 2025-08-18 |
| [`shushuzn/OpenClaw-RL`](https://github.com/shushuzn/OpenClaw-RL) | `Untagged/other` | 1 | 0 | 2026-04-03 |
| [`tenantcloud/laravel-api-versioning`](https://github.com/tenantcloud/laravel-api-versioning) | `v2.48.0` | 1 | 0 | 2026-04-11 |
| [`tenantcloud/php-guzzle-helper`](https://github.com/tenantcloud/php-guzzle-helper) | `v2.48.0` | 1 | 0 | 2025-07-02 |
| [`tenantcloud/laravel-mixins`](https://github.com/tenantcloud/laravel-mixins) | `v2.48.0` | 0 | 2 | 2026-04-11 |
| [`cansavvy/capstone-sandbox`](https://github.com/cansavvy/capstone-sandbox) | `Untagged/other` | 0 | 1 | 2025-07-14 |
| [`CircleCI-Public/circleci-server-monitoring-reference`](https://github.com/CircleCI-Public/circleci-server-monitoring-reference) | `:latest` | 0 | 1 | 2026-10-13 |
| [`dumasd/config-ops`](https://github.com/dumasd/config-ops) | `:latest` | 0 | 1 | 2025-11-23 |
| [`fx-integral/academia-archives`](https://github.com/fx-integral/academia-archives) | `v2.79.0` | 0 | 1 | 2026-05-12 |
| [`mohsen-deriv/action-create-pull-request-another-repo`](https://github.com/mohsen-deriv/action-create-pull-request-another-repo) | `Untagged/other` | 0 | 1 | 2023-11-16 |
| [`ONSdigital/aws-uploader`](https://github.com/ONSdigital/aws-uploader) | `Untagged/other` | 0 | 1 | 2026-10-14 |
| [`ArkaZhuo/compactionrl-agent-rl`](https://github.com/ArkaZhuo/compactionrl-agent-rl) | `Untagged/other` | 0 | 0 | 2026-09-12 |
| [`bccalegari/dev-link-iac`](https://github.com/bccalegari/dev-link-iac) | `v2.83.2` | 0 | 0 | 2026-01-21 |
| [`BirgerMoell/NVIDIA-Megatron-LM-context-extension`](https://github.com/BirgerMoell/NVIDIA-Megatron-LM-context-extension) | `Untagged/other` | 0 | 0 | 2026-04-17 |
| [`BochunZhang/Megatron-LM-Scale-Down`](https://github.com/BochunZhang/Megatron-LM-Scale-Down) | `Untagged/other` | 0 | 0 | 2026-10-13 |
| [`btarun13/capstone_sand`](https://github.com/btarun13/capstone_sand) | `Untagged/other` | 0 | 0 | 2025-09-06 |
| [`buegelbeatz/tsp-quantum`](https://github.com/buegelbeatz/tsp-quantum) | `:latest` | 0 | 0 | 2026-04-29 |
| [`carriewright11/capstone`](https://github.com/carriewright11/capstone) | `Untagged/other` | 0 | 0 | 2025-06-29 |
| [`cidx-org/cidx`](https://github.com/cidx-org/cidx) | `v2.95 (documented)` | 0 | 0 | 2026-10-14 |
| [`Cliftonz/k8-cuelang-template`](https://github.com/Cliftonz/k8-cuelang-template) | `v2.62.0` | 0 | 0 | 2026-08-17 |
| [`damianoamatruda/ethz-large-scale-ai-engineering-autumn-2025`](https://github.com/damianoamatruda/ethz-large-scale-ai-engineering-autumn-2025) | `Untagged/other` | 0 | 0 | 2025-12-19 |
| [`fhdsl/capstone-sandbox`](https://github.com/fhdsl/capstone-sandbox) | `Untagged/other` | 0 | 0 | 2025-07-28 |
| [`FranBe/Making_science_reproducible_project`](https://github.com/FranBe/Making_science_reproducible_project) | `Untagged/other` | 0 | 0 | 2026-06-02 |
| [`geekittime/evoclaw`](https://github.com/geekittime/evoclaw) | `Untagged/other` | 0 | 0 | 2026-04-19 |
| [`gian-didom/pkl-lang-ssh`](https://github.com/gian-didom/pkl-lang-ssh) | `v2.40.1` | 0 | 0 | 2024-06-12 |
| [`HannanJaved/megatron-tokenizer`](https://github.com/HannanJaved/megatron-tokenizer) | `Untagged/other` | 0 | 0 | 2026-02-20 |
| [`HBinLi/HERO_My`](https://github.com/HBinLi/HERO_My) | `Untagged/other` | 0 | 0 | 2026-10-10 |
| [`Heinz217/PreMidTrainVL-Qwen3Dense`](https://github.com/Heinz217/PreMidTrainVL-Qwen3Dense) | `Untagged/other` | 0 | 0 | 2026-04-27 |
| [`JoyboySol/Megatron-LM`](https://github.com/JoyboySol/Megatron-LM) | `Untagged/other` | 0 | 0 | 2025-11-26 |
| [`JoyboySol/Megatron-SFT`](https://github.com/JoyboySol/Megatron-SFT) | `Untagged/other` | 0 | 0 | 2025-11-29 |
| [`JoyboySol/YuLan-SFT`](https://github.com/JoyboySol/YuLan-SFT) | `Untagged/other` | 0 | 0 | 2026-09-10 |
| [`kubiya-solutions-engineering/developer-onboarding`](https://github.com/kubiya-solutions-engineering/developer-onboarding) | `:latest` | 0 | 0 | 2025-05-27 |
| [`kubiya-solutions-engineering/hackathon-tools`](https://github.com/kubiya-solutions-engineering/hackathon-tools) | `:latest` | 0 | 0 | 2024-12-10 |
| [`kweav/capstone-sandbox-KI`](https://github.com/kweav/capstone-sandbox-KI) | `Untagged/other` | 0 | 0 | 2025-06-25 |
| [`kweav/reproducibility-capstone-sandbox-KI`](https://github.com/kweav/reproducibility-capstone-sandbox-KI) | `Untagged/other` | 0 | 0 | 2025-06-25 |
| [`Miya-315/7608_LLM`](https://github.com/Miya-315/7608_LLM) | `Untagged/other` | 0 | 0 | 2026-04-30 |
| [`obigriffith/obigriffith-capstone-sandbox`](https://github.com/obigriffith/obigriffith-capstone-sandbox) | `Untagged/other` | 0 | 0 | 2025-07-24 |
| [`quartz-technology/dagger-agents`](https://github.com/quartz-technology/dagger-agents) | `v2.68.1` | 0 | 0 | 2025-03-31 |
| [`roosseetch/real-one-portfolio`](https://github.com/roosseetch/real-one-portfolio) | `Untagged/other` | 0 | 0 | 2026-10-14 |
| [`shanearcaro/automatic-labeler`](https://github.com/shanearcaro/automatic-labeler) | `:latest` | 0 | 0 | 2023-12-13 |
| [`shushuzn/workspace`](https://github.com/shushuzn/workspace) | `Untagged/other` | 0 | 0 | 2026-04-12 |
| [`sunyanguomt/telechat_train`](https://github.com/sunyanguomt/telechat_train) | `Untagged/other` | 0 | 0 | 2026-07-28 |
| [`TangZhe96/OptiCo`](https://github.com/TangZhe96/OptiCo) | `Untagged/other` | 0 | 0 | 2026-08-13 |
| [`tenantcloud/laravel-restrict-commands`](https://github.com/tenantcloud/laravel-restrict-commands) | `v2.48.0` | 0 | 0 | 2026-04-11 |
| [`tenantcloud/php-cs-fixer-rule-sets`](https://github.com/tenantcloud/php-cs-fixer-rule-sets) | `v2.48.0` | 0 | 0 | 2025-10-21 |
| [`tenantcloud/php-emailer-sdk`](https://github.com/tenantcloud/php-emailer-sdk) | `v2.48.0` | 0 | 0 | 2025-07-03 |
| [`tenantcloud/php-tenant-turner-sdk`](https://github.com/tenantcloud/php-tenant-turner-sdk) | `v2.48.0` | 0 | 0 | 2026-04-11 |
| [`tensorplex-labs/dojo`](https://github.com/tensorplex-labs/dojo) | `v2.79.0` | 0 | 0 | 2025-11-03 |
| [`thedannymarsh/merge-workflow-dummy`](https://github.com/thedannymarsh/merge-workflow-dummy) | `:latest` | 0 | 0 | 2026-08-11 |
| [`Viasat/vionix`](https://github.com/Viasat/vionix) | `v2.69.0` | 0 | 0 | 2026-07-20 |
| [`weidezhang/megatron_study`](https://github.com/weidezhang/megatron_study) | `Untagged/other` | 0 | 0 | 2026-04-17 |
| [`xinqi1003/LLMCC-service-`](https://github.com/xinqi1003/LLMCC-service-) | `Untagged/other` | 0 | 0 | 2025-12-11 |
| [`xuOAO/pipeline-scheduler`](https://github.com/xuOAO/pipeline-scheduler) | `Untagged/other` | 0 | 0 | 2026-09-06 |
| [`YYKKWW/SSO_test`](https://github.com/YYKKWW/SSO_test) | `Untagged/other` | 0 | 0 | 2026-09-24 |
| [`Zhou-jiecheng/Belayer`](https://github.com/Zhou-jiecheng/Belayer) | `Untagged/other` | 0 | 0 | 2026-07-30 |

## Source and reproduction

For each `owner/repo` in the [main report](./downstream-usage-report.md), request `GET https://api.github.com/repos/owner/repo` and record `stargazers_count`, `forks_count` and UTC date from `pushed_at`. The named project URLs above are the API's public repository counterparts. Numbers were sampled on one date but calls were not an atomic snapshot. Neither GitHub repository metadata nor Docker Hub's aggregate image-pull counter yields per-tag or per-project image usage.
