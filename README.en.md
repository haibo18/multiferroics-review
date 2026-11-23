# multiferroics-review

Multiferroics and magnetoelectric coupling (Spaldin, 2027 Nobel Prize in Physics candidate) bilingual ZH/EN review + Lean 4 formalization skeleton.

**中文版：[README.md](./README.md)**

This repository collects the research output, conclusions, and machine-checkable
formalization of "Nicola Spaldin and room-temperature multiferroic BiFeO₃",
maintained under Semantic Versioning with bilingual Chinese/English documents.

## Layout

```
multiferroics-review/
├── paper/
│   ├── multiferroics_review_zh.md   # 中文综述
│   └── multiferroics_review_en.md   # English review
├── Multiferroics.lean               # Lean library root
├── Multiferroics/
│   ├── Basic.lean
│   └── Proofs.lean                  # BFO numbers / timeline / mechanism classes
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/               # Lean CI
├── CHANGELOG.md
├── README.md                         # 中文
└── README.en.md                     # this file
```

## Highlights

- **Idea**: a multiferroic hosts two or more ferroic orders in one phase; the most valuable is ferroelectricity + magnetism.
- **Core conflict**: conventional ferroelectrics need d⁰ cations, magnetism needs dⁿ cations — mutually exclusive on the same ion.
- **Spaldin's breakthrough**: use the 6s² lone pair on Bi³⁺/Pb²⁺ for ferroelectricity, and Fe³⁺/Mn³⁺ d-electrons for magnetism, placing them on different cations.
- **Milestones**: 2000 Spaldin first-principles prediction of BiFeO₃; 2003 Ramesh group epitaxial thin-film experiment with giant polarization.
- **BiFeO₃ numbers**: Tc ≈ 1103 K, TN ≈ 643 K, P ≈ 90 μC/cm², cycloid period ≈ 62 nm — all far above room temperature.
- **Applications**: magnetoelectric RAM (MERAM), ultrasensitive magnetic sensors, tunable magnetoelectric antennas, voltage-controlled spintronics.
- **Prize**: 2027 Nobel Prize in Physics candidate; central figure Nicola A. Spaldin (ETH Zürich).

## Lean formalization

Toolchain: `leanprover/lean4:v4.36.0`, core library only, **no Mathlib**.

Build:

```bash
lake build
```

The formalization only covers **numerically decidable** claims in the review:

1. BFO Tc = 1103 K, TN = 643 K, P = 90 μC/cm², room temperature = 300 K;
2. Both ordering temperatures are above room temperature → room-temperature multiferroic;
3. BFO Tc > TN;
4. Timeline 1990 < 2000 < 2003;
5. Fe³⁺ d⁵ = 5 d-electrons; Bi³⁺ 6s² lone pair = 2 electrons;
6. Cycloid period ≈ 62 nm;
7. The 4 classes of multiferroic mechanism (Spaldin & Fiebig).

> Condensed-matter and materials conclusions are sourced from peer-reviewed
> literature; this project does not treat physical mechanisms as arithmetically
> provable propositions. There are **zero** `sorry` / `admit` / `axiom` in the
> sources.

## Bilingual version management

- Papers: `paper/multiferroics_review_zh.md` (Chinese) and `paper/multiferroics_review_en.md` (English) are kept in sync;
- Docs: `README.md` (Chinese) and `README.en.md` (English) cross-link each other;
- Changelog: `CHANGELOG.md` keeps both Chinese and English paragraphs;
- When revising the paper, update both language versions in the same commit, and tag the subject with `docs(zh)` / `docs(en)`.

## Versioning

- Semantic Versioning (`MAJOR.MINOR.PATCH`).
- All notable changes are recorded in [`CHANGELOG.md`](CHANGELOG.md).
- `main` is the trunk. Paper revisions, formalization additions, and dependency
  bumps are separate commits, using Conventional Commits
  (`feat:` / `docs:` / `fix:` / `chore:`).
- Each release baseline is tagged `vX.Y.Z`.

## References

See the "References" section at the end of the review papers.
