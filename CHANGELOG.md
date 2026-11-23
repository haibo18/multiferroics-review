# Changelog

本仓库所有显著变更均记录于此。格式遵循
[Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。
All notable changes are recorded here; format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
versioning follows [Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-11-24

### Added

- 中英双语综述论文：
  - `paper/multiferroics_review_zh.md`：多铁性与磁电耦合、d⁰/dⁿ 矛盾、
    Spaldin 孤对电子设计规则、BiFeO₃ 关键参数、时间线、磁电耦合与
    应用外溢、2027 诺贝尔物理学奖候选潜质评估；
  - `paper/multiferroics_review_en.md`: English translation of the above.
- Lean 4 形式化工程 `Multiferroics/`（工具链 `leanprover/lean4:v4.36.0`，核心库）：
  - BFO 温度与极化参数 `bfoTcKelvin = 1103`、`bfoTnKelvin = 643`、
    `bfoPolarizationMuCcm2 = 90`、`roomTempKelvin = 300`；
  - BFO 两个有序温度均高于室温、Tc > TN 的命题；
  - 时间线 `ramirezReviewYear = 1990 < spaldinPredictionYear = 2000 < rameshExperimentYear = 2003`；
  - Fe³⁺ d⁵ = 5、Bi³⁺ 6s² 孤对 = 2；
  - cycloid 周期 `bfoCycloidPeriodNm = 62`；
  - Spaldin & Fiebig 4 类多铁机制 `multiferroicMechanismClasses = 4`。
- 双语文档：`README.md`（中文）与 `README.en.md`（英文）。
- GitHub Actions Lean CI（`leanprover/lean-action`）。
- 本变更日志。

### Verification

- `lake build`：`Build completed successfully`，`errors=0`，`warnings=0`。
- `sorry` / `admit` / `axiom`：0 处。
