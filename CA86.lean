import CA86.Blocks.Block37
import CA86.Blocks.Block38
import CA86.Blocks.Block39

namespace CA86
set_option maxRecDepth 100000

theorem all_blocks : ∀ i j : Fin 40, i < j → PairCovered certificate i j :=
  (Fin.forall_fin_succ.mpr ⟨block_0, (Fin.forall_fin_succ.mpr ⟨block_1, (Fin.forall_fin_succ.mpr ⟨block_2, (Fin.forall_fin_succ.mpr ⟨block_3, (Fin.forall_fin_succ.mpr ⟨block_4, (Fin.forall_fin_succ.mpr ⟨block_5, (Fin.forall_fin_succ.mpr ⟨block_6, (Fin.forall_fin_succ.mpr ⟨block_7, (Fin.forall_fin_succ.mpr ⟨block_8, (Fin.forall_fin_succ.mpr ⟨block_9, (Fin.forall_fin_succ.mpr ⟨block_10, (Fin.forall_fin_succ.mpr ⟨block_11, (Fin.forall_fin_succ.mpr ⟨block_12, (Fin.forall_fin_succ.mpr ⟨block_13, (Fin.forall_fin_succ.mpr ⟨block_14, (Fin.forall_fin_succ.mpr ⟨block_15, (Fin.forall_fin_succ.mpr ⟨block_16, (Fin.forall_fin_succ.mpr ⟨block_17, (Fin.forall_fin_succ.mpr ⟨block_18, (Fin.forall_fin_succ.mpr ⟨block_19, (Fin.forall_fin_succ.mpr ⟨block_20, (Fin.forall_fin_succ.mpr ⟨block_21, (Fin.forall_fin_succ.mpr ⟨block_22, (Fin.forall_fin_succ.mpr ⟨block_23, (Fin.forall_fin_succ.mpr ⟨block_24, (Fin.forall_fin_succ.mpr ⟨block_25, (Fin.forall_fin_succ.mpr ⟨block_26, (Fin.forall_fin_succ.mpr ⟨block_27, (Fin.forall_fin_succ.mpr ⟨block_28, (Fin.forall_fin_succ.mpr ⟨block_29, (Fin.forall_fin_succ.mpr ⟨block_30, (Fin.forall_fin_succ.mpr ⟨block_31, (Fin.forall_fin_succ.mpr ⟨block_32, (Fin.forall_fin_succ.mpr ⟨block_33, (Fin.forall_fin_succ.mpr ⟨block_34, (Fin.forall_fin_succ.mpr ⟨block_35, (Fin.forall_fin_succ.mpr ⟨block_36, (Fin.forall_fin_succ.mpr ⟨block_37, (Fin.forall_fin_succ.mpr ⟨block_38, (Fin.forall_fin_succ.mpr ⟨block_39, (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

/-- The explicit authenticated 86 by 40 ternary matrix is a covering array. -/
theorem ca86_covering : IsCoveringArray certificate := by
  intro i j l hij hjl a b c
  exact all_blocks i j hij l hjl a b c

theorem ca86_existence : Feasible 86 40 3 :=
  ⟨certificate, ca86_covering⟩

/-- The least feasible number of rows for strength three is at most 86. -/
theorem CAN_3_40_3_le_86 : CAN₃ 40 3 ≤ 86 :=
  CAN₃_le_of_feasible ca86_existence

/-- Explicitly records the feasibility and minimality semantics of CAN₃ here. -/
theorem CAN_3_40_3_spec :
    Feasible (CAN₃ 40 3) 40 3 ∧
      ∀ n, Feasible n 40 3 → CAN₃ 40 3 ≤ n :=
  CAN₃_spec ⟨86, ca86_existence⟩

end CA86
