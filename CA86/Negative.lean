import CA86.Checker

namespace CA86

/-- A separate invalid control; the authenticated matrix is never changed. -/
def zeroArray : Fin 86 → Fin 40 → Fin 3 := fun _ _ => 0

theorem zeroArray_not_covering : ¬ IsCoveringArray zeroArray := by
  intro h
  obtain ⟨r, hr, _⟩ := h 0 1 2 (by decide) (by decide) 1 0 0
  exact (by decide : (0 : Fin 3) ≠ 1) hr

theorem zeroArray_checker_rejected : checkPair zeroArray 0 1 #[] = false := by
  decide +kernel

end CA86
