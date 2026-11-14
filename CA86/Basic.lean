import Init

namespace CA86

/-- Strength-three coverage: every ordered choice of three distinct columns
realizes every assignment of three alphabet symbols in some row. -/
def IsCoveringArray {n k v : Nat} (A : Fin n → Fin k → Fin v) : Prop :=
  ∀ i j l : Fin k, i < j → j < l →
    ∀ a b c : Fin v, ∃ r : Fin n,
      A r i = a ∧ A r j = b ∧ A r l = c

/-- An n-row, k-column covering array over v symbols exists. -/
def Feasible (n k v : Nat) : Prop :=
  ∃ A : Fin n → Fin k → Fin v, IsCoveringArray A

private theorem least_exists {P : Nat → Prop} (h : ∃ n, P n) :
    ∃ n, P n ∧ ∀ m, P m → n ≤ m := by
  classical
  obtain ⟨b, hb⟩ := h
  have aux : ∀ b, P b → ∃ n, P n ∧ ∀ m, P m → n ≤ m := by
    intro b
    induction b using Nat.strongRecOn with
    | ind b ih =>
      intro hb
      by_cases hx : ∃ m, m < b ∧ P m
      · obtain ⟨m, hm, hpm⟩ := hx
        exact ih m hm hpm
      · refine ⟨b, hb, ?_⟩
        intro m hm
        by_cases hn : b ≤ m
        · exact hn
        · exact False.elim (hx ⟨m, Nat.lt_of_not_ge hn, hm⟩)
  exact aux b hb

/-- The covering array number for strength three: the least feasible row count.
The fallback 0 only applies to parameters with no feasible array. The theorem
`CAN₃_spec` supplies feasibility and minimality whenever an array exists. -/
noncomputable def CAN₃ (k v : Nat) : Nat := by
  classical
  exact if h : ∃ n, Feasible n k v then Classical.choose (least_exists h) else 0

theorem CAN₃_spec {k v : Nat} (h : ∃ n, Feasible n k v) :
    Feasible (CAN₃ k v) k v ∧ ∀ m, Feasible m k v → CAN₃ k v ≤ m := by
  classical
  unfold CAN₃
  rw [dif_pos h]
  exact Classical.choose_spec (least_exists h)

theorem CAN₃_le_of_feasible {n k v : Nat} (h : Feasible n k v) :
    CAN₃ k v ≤ n :=
  (CAN₃_spec ⟨n, h⟩).2 n h

end CA86
