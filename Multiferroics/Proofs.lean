/-
  Multiferroics.Proofs
  ~~~~~~~~~~~~~~~~~~~~~

  Formalization of textbook facts about multiferroic materials,
  centered on Nicola Spaldin's 2000 theoretical prediction and the
  2003 Ramesh-group experimental realization of room-temperature
  multiferroicity in BiFeO3 thin films.

  All numeric claims are expressed over `Nat` so that they can be
  closed by `decide` / `simp` / `omega` without Mathlib.
-/

namespace Multiferroics

-- ============================================================================
-- 1. What is a multiferroic
-- ============================================================================

/-- Ferroic order parameters that can coexist in a single phase. -/
inductive FerroicOrder : Type
  | ferroelectric      -- spontaneous switchable electric polarization P
  | ferromagnetic      -- spontaneous switchable magnetization M
  | ferroelastic       -- spontaneous switchable strain ε

/-- A multiferroic is a material that exhibits two or more ferroic orders
    in the same phase.  Here we focus on the ferroelectric + magnetic
    combination, which is the scientifically interesting and useful one. -/
inductive MultiferroicKind : Type
  | ferroelectric_and_ferromagnetic   -- "true" multiferroic
  | ferroelectric_and_antiferromagnetic -- e.g. BiFeO3
  | other

-- ============================================================================
-- 2. BiFeO3 (BFO): the canonical room-temperature multiferroic
-- ============================================================================

/-- BiFeO3 ferroelectric Curie temperature, in K (≈ 1103 K). -/
def bfoTcKelvin : Nat := 1103

/-- BiFeO3 G-type antiferromagnetic Neel temperature, in K (≈ 643 K). -/
def bfoTnKelvin : Nat := 643

/-- BiFeO3 spontaneous polarization in (001)-oriented thin film,
    in μC/cm², rounded to 90. -/
def bfoPolarizationMuCcm2 : Nat := 90

/-- Room temperature in Kelvin, by definition 300 K. -/
def roomTempKelvin : Nat := 300

theorem bfoTc_value : bfoTcKelvin = 1103 := by rfl

theorem bfoTn_value : bfoTnKelvin = 643 := by rfl

theorem bfoPolarization_value : bfoPolarizationMuCcm2 = 90 := by rfl

/-- Both the Curie and Neel temperatures are well above room temperature,
    which is the defining fact that makes BFO a *room-temperature*
    multiferroic. -/
theorem bfoBothOrdersSurviveRoomTemp :
    bfoTcKelvin > roomTempKelvin ∧ bfoTnKelvin > roomTempKelvin := by
  simp [bfoTcKelvin, bfoTnKelvin, roomTempKelvin]

/-- The ferroelectric ordering temperature is higher than the magnetic
    ordering temperature in BFO. -/
theorem bfoTc_gt_bfoTn : bfoTcKelvin > bfoTnKelvin := by
  simp [bfoTcKelvin, bfoTnKelvin]

-- ============================================================================
-- 3. Historical timeline
-- ============================================================================

/-- Spaldin's 2000 theoretical prediction that perovskite BiFeO3 should
    be a room-temperature multiferroic. -/
def spaldinPredictionYear : Nat := 2000

/-- Ramesh group's 2003 experimental realization of epitaxial BiFeO3
    thin films with giant ferroelectric polarization. -/
def rameshExperimentYear : Nat := 2003

/-- Ramirez's earlier 1990s classification of multiferroics as a
    rare materials class. -/
def ramirezReviewYear : Nat := 1990

theorem timeline_ordered :
    ramirezReviewYear < spaldinPredictionYear ∧
    spaldinPredictionYear < rameshExperimentYear := by
  simp [ramirezReviewYear, spaldinPredictionYear, rameshExperimentYear]

theorem spaldin_before_ramesh : spaldinPredictionYear < rameshExperimentYear := by
  simp [spaldinPredictionYear, rameshExperimentYear]

-- ============================================================================
-- 4. The microscopic origin: why ferroelectricity and magnetism usually
--    do not coexist (Spaldin's key insight)
-- ============================================================================

/- Conventional ferroelectrics (BaTiO3, PbTiO3) use d0 transition-metal
   cations (Ti4+, Zr4+, Nb5+), which have no d electrons and therefore
   no local magnetic moment.  Magnetism needs partially filled d shells
   (e.g. Fe3+ d5, Mn3+ d4).  This is the "d0 vs dn" conflict. -/

/-- Fe3+ has 5 d electrons (d5 high spin), so it is magnetic, but it
    does not normally drive the off-centering that causes ferroelectricity.
    BiFeO3 resolves the conflict through the 6s2 lone pair on Bi3+. -/
def fe3dElectrons : Nat := 5

/-- Bi3+ carries a 6s2 lone pair that drives the polar distortion. -/
def biLonePairElectrons : Nat := 2

theorem fe3d5_value : fe3dElectrons = 5 := by rfl

theorem biLonePair_value : biLonePairElectrons = 2 := by rfl

-- ============================================================================
-- 5. Magnetoelectric coupling
-- ============================================================================

/-- In BiFeO3 the antiferromagnetic order is coupled to the ferroelectric
    polarization via a long-period cycloid spin structure (≈ 62 nm period).
    This cycloid can be unwound by strain, thin-film geometry, or magnetic
    fields, releasing a net weak ferromagnetism. -/
def bfoCycloidPeriodNm : Nat := 62

theorem bfoCycloid_value : bfoCycloidPeriodNm = 62 := by rfl

-- ============================================================================
-- 6. Why this is a Nobel-caliber body of work
-- ============================================================================

/- Spaldin did not just discover a material; she built the *materials
   design rule* for multiferroics: combine a lone-pair active cation
   (Bi3+, Pb2+) with a magnetic transition metal (Fe3+, Mn3+) in a
   perovskite, and break the inversion symmetry through the lone pair.
   This has produced a decade of materials by design. -/

/-- Number of "classes" of multiferroic mechanism classified by Spaldin
    and Fiebig (lone-pair, charge-order, geometric, spin-driven). -/
def multiferroicMechanismClasses : Nat := 4

theorem multiferroicMechanisms_value : multiferroicMechanismClasses = 4 := by
  simp [multiferroicMechanismClasses]

end Multiferroics
