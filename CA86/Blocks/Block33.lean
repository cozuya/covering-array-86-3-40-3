import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block30

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_33_34 : Array Nat := #[
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
  98183376416949666656591710761051174595489108839723534464,
  13271703748694563966516926368747956090622818050432665728,
  129496645289412726706610113586462496321618847020492359808,
  14574507614189977500608728800536665747964517292624598656,
  258226419680242965500198302345480722683747922464031230080
]

private theorem checked_33_34 : checkPair certificate 33 34 ws_33_34 = true := by decide +kernel

private theorem pair_33_34 : PairCovered certificate 33 34 :=
  checkPair_sound checked_33_34

private def ws_33_35 : Array Nat := #[
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
  167907042368530531672759931492212162593128113955928757376,
  49815114185667368289981912678971954784404531333296212352,
  99232085504026370025500427155099626811391355995056949632,
  147888842741626392459151482968103152000748686266631115008
]

private theorem checked_33_35 : checkPair certificate 33 35 ws_33_35 = true := by decide +kernel

private theorem pair_33_35 : PairCovered certificate 33 35 :=
  checkPair_sound checked_33_35

private def ws_33_36 : Array Nat := #[
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
  62162660164790117698097681804438068475689892290358331776,
  12745665282582945518149685299129495551557520707970845056,
  62593809175092039759635557445940198065449971438596575488
]

private theorem checked_33_36 : checkPair certificate 33 36 ws_33_36 = true := by decide +kernel

private theorem pair_33_36 : PairCovered certificate 33 36 :=
  checkPair_sound checked_33_36

private def ws_33_37 : Array Nat := #[
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
  129211570330055075414170593981625912694982597236218021632,
  62595981035032969553784423943659420514998097043515479040
]

private theorem checked_33_37 : checkPair certificate 33 37 ws_33_37 = true := by decide +kernel

private theorem pair_33_37 : PairCovered certificate 33 37 :=
  checkPair_sound checked_33_37

private def ws_33_38 : Array Nat := #[
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
  362435974030730714555854203606827836775632157368834967680
]

private theorem checked_33_38 : checkPair certificate 33 38 ws_33_38 = true := by decide +kernel

private theorem pair_33_38 : PairCovered certificate 33 38 :=
  checkPair_sound checked_33_38

theorem block_33 : ∀ j : Fin 40, (33 : Fin 40) < j → PairCovered certificate 33 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 27)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 28)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 29)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 30)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 31)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 32)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((33 : Fin 40) < 33)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_33_34), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_33_35), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_33_36), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_33_37), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_33_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
