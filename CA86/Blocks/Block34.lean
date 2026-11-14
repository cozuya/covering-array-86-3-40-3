import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block31

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_34_35 : Array Nat := #[
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
  86256756953837235356609272835313652877044763631181480576,
  55941342893222928350251530431775188802538858123268047488,
  98753554698083554214113240337476528163003433186930836096,
  86589377850367241809080718381853945312974916430506709760
]

private theorem checked_34_35 : checkPair certificate 34 35 ws_34_35 = true := by decide +kernel

private theorem pair_34_35 : PairCovered certificate 34 35 :=
  checkPair_sound checked_34_35

private def ws_34_36 : Array Nat := #[
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
  167521685444385406253427344561402067609042885500264191360,
  12940220402666719763443484783888482356949202131864456192,
  87065847845835921264790782051125674849616247995607946624
]

private theorem checked_34_36 : checkPair certificate 34 36 ws_34_36 = true := by decide +kernel

private theorem pair_34_36 : PairCovered certificate 34 36 :=
  checkPair_sound checked_34_36

private def ws_34_37 : Array Nat := #[
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
  129020382849071687940141132144003391342079222910680239104,
  344574301193877655958098527394694666580635373098028634112
]

private theorem checked_34_37 : checkPair certificate 34 37 ws_34_37 = true := by decide +kernel

private theorem pair_34_37 : PairCovered certificate 34 37 :=
  checkPair_sound checked_34_37

private def ws_34_38 : Array Nat := #[
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
  190796485123053881311792917204318007730828594096638642304
]

private theorem checked_34_38 : checkPair certificate 34 38 ws_34_38 = true := by decide +kernel

private theorem pair_34_38 : PairCovered certificate 34 38 :=
  checkPair_sound checked_34_38

theorem block_34 : ∀ j : Fin 40, (34 : Fin 40) < j → PairCovered certificate 34 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 27)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 28)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 29)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 30)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 31)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 32)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 33)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((34 : Fin 40) < 34)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_34_35), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_34_36), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_34_37), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_34_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
