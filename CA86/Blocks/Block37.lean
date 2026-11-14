import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block34

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_37_38 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  68725496203246864954103925926162492384043493973192984192
]

private theorem checked_37_38 : checkPair certificate 37 38 ws_37_38 = true := by decide +kernel

private theorem pair_37_38 : PairCovered certificate 37 38 :=
  checkPair_sound checked_37_38

theorem block_37 : ∀ j : Fin 40, (37 : Fin 40) < j → PairCovered certificate 37 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 27)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 28)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 29)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 30)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 31)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 32)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 33)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 34)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 35)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 36)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((37 : Fin 40) < 37)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_37_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
