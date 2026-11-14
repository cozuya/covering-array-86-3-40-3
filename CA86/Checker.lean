import CA86.Basic

namespace CA86

/-- All requirements for a fixed first and second column. -/
def PairCovered {n k v : Nat} (A : Fin n → Fin k → Fin v)
    (i j : Fin k) : Prop :=
  ∀ l : Fin k, j < l → ∀ a b c : Fin v, ∃ r : Fin n,
    A r i = a ∧ A r j = b ∧ A r l = c

/-- A proposed row for each third column and ternary symbol triple.
Each array element contains 27 row indices packed into seven-bit digits.
The modulo ensures even malformed witness data selects a legitimate row;
the equality checks below still have to succeed. -/
def witnessRow (ws : Array Nat) (l : Fin 40) (a b c : Fin 3) : Fin 86 :=
  ⟨((ws[l.val]?.getD 0 >>> (7 * (a.val * 9 + b.val * 3 + c.val))) &&& 127) % 86,
    Nat.mod_lt _ (by decide)⟩
/-- Check the actual three matrix entries for every proposed row. -/
def checkPair (A : Fin 86 → Fin 40 → Fin 3) (i j : Fin 40)
    (ws : Array Nat) : Bool :=
  (List.finRange 40).all fun l =>
    if j < l then
      (List.finRange 3).all fun a =>
        (List.finRange 3).all fun b =>
          (List.finRange 3).all fun c =>
            let r := witnessRow ws l a b c
            (A r i == a) && (A r j == b) && (A r l == c)
    else true

theorem checkPair_sound {A : Fin 86 → Fin 40 → Fin 3} {i j : Fin 40}
    {ws : Array Nat} (h : checkPair A i j ws = true) : PairCovered A i j := by
  intro l hj a b c
  have hl := List.all_eq_true.mp h l (by simp)
  simp only [if_pos hj] at hl
  have ha := List.all_eq_true.mp hl a (by simp)
  have hb := List.all_eq_true.mp ha b (by simp)
  have hc := List.all_eq_true.mp hb c (by simp)
  refine ⟨witnessRow ws l a b c, ?_⟩
  simpa only [Bool.and_eq_true, beq_iff_eq, and_assoc] using hc

end CA86
