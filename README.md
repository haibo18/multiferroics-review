# multiferroics-review

多铁性与磁电耦合（Spaldin，2027 诺贝尔物理学奖候选方向）中英双语综述 + Lean 4 形式化核验骨架。

**English version: [README.en.md](./README.en.md)**

本仓库沉淀「Nicola Spaldin 与室温多铁材料 BiFeO₃」课题的
研究内容、结论与可机器核验的形式化命题，按语义化版本持续维护，
并提供中英双语论文与文档。

## 目录结构

```
multiferroics-review/
├── paper/
│   ├── multiferroics_review_zh.md   # 中文综述
│   └── multiferroics_review_en.md   # English review
├── Multiferroics.lean               # Lean 库根模块
├── Multiferroics/
│   ├── Basic.lean
│   └── Proofs.lean                  # BFO 参数 / 时间线 / 机制分类
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/               # Lean CI
├── CHANGELOG.md
├── README.md                         # 本文件（中文）
└── README.en.md                     # English
```

## 论文要点

- **原理**：多铁材料在同一相内共存两种铁性序；最有价值的是铁电 + 磁性组合。
- **核心矛盾**：传统铁电需要 d⁰ 阳离子，磁性需要 dⁿ 阳离子，二者在同一离子上互斥。
- **Spaldin 破局**：用 Bi³⁺/Pb²⁺ 的 6s² 孤对电子驱动铁电，用 Fe³⁺/Mn³⁺ 的 d 电子提供磁性，把两者放在不同阳离子上。
- **里程碑**：2000 Spaldin 第一性原理预言 BiFeO₃；2003 Ramesh 组外延薄膜实验测得巨极化。
- **BiFeO₃ 参数**：Tc ≈ 1103 K，TN ≈ 643 K，P ≈ 90 μC/cm²，cycloid 周期 ≈ 62 nm，均远高于室温。
- **应用**：磁电存储器（MERAM）、超灵敏磁传感器、可调磁电天线、电压控制自旋电子学。
- **奖项**：2027 年诺贝尔物理学奖候选方向，核心人物 Nicola A. Spaldin（ETH Zürich）。

## Lean 形式化工程

工具链：`leanprover/lean4:v4.36.0`，仅依赖核心库，**无 Mathlib**。

构建：

```bash
lake build
```

形式化只覆盖论文中**可数值判定**的陈述：

1. BFO 居里温度 1103 K、尼尔温度 643 K、极化 90 μC/cm²、室温 300 K；
2. BFO 两个有序温度均高于室温 → 室温多铁；
3. BFO Tc > TN；
4. 时间线 1990 < 2000 < 2003；
5. Fe³⁺ d⁵ = 5 个 d 电子；Bi³⁺ 6s² 孤对 = 2 个；
6. cycloid 周期 ≈ 62 nm；
7. Spaldin & Fiebig 分类的 4 类多铁机制。

> 凝聚态物理与材料结论以同行评审文献为准；本工程不把物理机制
> 当作可由算术证明的命题。工程内 `sorry` / `admit` / `axiom` 数量为 0。

## 双语版本管理

- 论文：`paper/multiferroics_review_zh.md`（中文）与 `paper/multiferroics_review_en.md`（英文）内容对齐；
- 文档：`README.md`（中文）与 `README.en.md`（英文）互相链接；
- 变更日志：`CHANGELOG.md` 同时保留中英两段说明；
- 论文修订时应同步更新两个语言版本，提交信息在 subject 中注明 `docs(zh)` / `docs(en)`。

## 版本维护

- 遵循语义化版本（SemVer）：`MAJOR.MINOR.PATCH`。
- 所有显著变更记录于 [`CHANGELOG.md`](CHANGELOG.md)。
- `main` 为主干分支；论文修订、形式化补充、依赖升级分别提交，提交信息
  采用 Conventional Commits（`feat:` / `docs:` / `fix:` / `chore:` 等）。
- 每个发布基线打 Git tag：`vX.Y.Z`。

## 参考文献

见论文末尾「参考文献」一节。
