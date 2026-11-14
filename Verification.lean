import CA86
import CA86.Negative

#print CA86.IsCoveringArray
#print CA86.CAN₃
#check CA86.ca86_covering
#check CA86.CAN_3_40_3_le_86
#check CA86.CAN_3_40_3_spec
#print axioms CA86.checkPair_sound
#print axioms CA86.ca86_covering
#print axioms CA86.ca86_existence
#print axioms CA86.CAN_3_40_3_le_86
#print axioms CA86.CAN_3_40_3_spec
#print axioms CA86.zeroArray_not_covering
#print axioms CA86.zeroArray_checker_rejected

namespace CA86.Verification

/-- Restate the covering property with every dimension and quantifier explicit. -/
theorem exact_statement :
    ∀ i j l : Fin 40, i < j → j < l →
      ∀ a b c : Fin 3, ∃ r : Fin 86,
        certificate r i = a ∧ certificate r j = b ∧ certificate r l = c :=
  ca86_covering

/-- Restate both the numerical bound and its minimum-row-count semantics. -/
theorem exact_bound :
    CAN₃ 40 3 ≤ 86 ∧ Feasible (CAN₃ 40 3) 40 3 ∧
      ∀ n, Feasible n 40 3 → CAN₃ 40 3 ≤ n :=
  ⟨CAN_3_40_3_le_86, CAN_3_40_3_spec⟩

end CA86.Verification

#check CA86.Verification.exact_statement
#check CA86.Verification.exact_bound
#print axioms CA86.Verification.exact_statement
#print axioms CA86.Verification.exact_bound
