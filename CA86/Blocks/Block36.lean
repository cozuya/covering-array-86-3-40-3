import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block33

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_36_37 : Array Nat := #[
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
  43397020292750445756416314833304795245305874681807703040,
  62595606595516555989951017777942958814656720861221229568
]

private theorem checked_36_37 : checkPair certificate 36 37 ws_36_37 = true := by decide +kernel

private theorem pair_36_37 : PairCovered certificate 36 37 :=
  checkPair_sound checked_36_37

private def ws_36_38 : Array Nat := #[
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
  441503165844056007086368718771592183625020684573417214592
]

private theorem checked_36_38 : checkPair certificate 36 38 ws_36_38 = true := by decide +kernel

private theorem pair_36_38 : PairCovered certificate 36 38 :=
  checkPair_sound checked_36_38

theorem block_36 : ∀ j : Fin 40, (36 : Fin 40) < j → PairCovered certificate 36 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 27)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 28)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 29)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 30)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 31)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 32)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 33)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 34)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 35)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((36 : Fin 40) < 36)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_36_37), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_36_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
