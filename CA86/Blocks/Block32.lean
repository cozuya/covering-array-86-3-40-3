import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block29

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_32_33 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  129116566785231195507095624635561565451517786834363190400,
  49526622398709079468072081099511663132611255498816326784,
  62308591011748391537185350549964229204495289382586256512,
  51117961827533948315906216139288944794357358046609133696,
  129211558548126711814832628146878819304658980869268457216,
  62595861421536343259631957245816031311253618856483329024
]

private theorem checked_32_33 : checkPair certificate 32 33 ws_32_33 = true := by decide +kernel

private theorem pair_32_33 : PairCovered certificate 32 33 :=
  checkPair_sound checked_32_33

private def ws_32_34 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  168006936162610837959625145824923763697258752509764720768,
  160392353985996817207343062198433974820658404803261612672,
  129649295867748476711708318309792795404076696403504644736,
  129649281208311730759810729395640627929320472481003324032,
  411961069315928261956689231960673257083216612664296624896
]

private theorem checked_32_34 : checkPair certificate 32 34 ws_32_34 = true := by decide +kernel

private theorem pair_32_34 : PairCovered certificate 32 34 :=
  checkPair_sound checked_32_34

private def ws_32_35 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  18440859751817438601204489463013552122854476763130610304,
  49183932529498246678537525306504874394228726241056375424,
  18440865438857285982929458938745409381315216053154988672,
  6276676396220982366846033026900994713792889662099411712
]

private theorem checked_32_35 : checkPair certificate 32 35 ws_32_35 = true := by decide +kernel

private theorem pair_32_35 : PairCovered certificate 32 35 :=
  checkPair_sound checked_32_35

private def ws_32_36 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  61453282617959710479985366526172393236379473111878584320,
  18878640510763896519129529864844940918947051672864820096,
  61473802104585808424190797470523698824931795280532588544
]

private theorem checked_32_36 : checkPair certificate 32 36 ws_32_36 = true := by decide +kernel

private theorem pair_32_36 : PairCovered certificate 32 36 :=
  checkPair_sound checked_32_36

private def ws_32_37 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  129211532650551270641656923667171341014010442525192898304,
  62596053815713084548658386690448178325017755451230753792
]

private theorem checked_32_37 : checkPair certificate 32 37 ws_32_37 = true := by decide +kernel

private theorem pair_32_37 : PairCovered certificate 32 37 :=
  checkPair_sound checked_32_37

private def ws_32_38 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  355687130739113777328484328974869485797925418099815387904
]

private theorem checked_32_38 : checkPair certificate 32 38 ws_32_38 = true := by decide +kernel

private theorem pair_32_38 : PairCovered certificate 32 38 :=
  checkPair_sound checked_32_38

theorem block_32 : ∀ j : Fin 40, (32 : Fin 40) < j → PairCovered certificate 32 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 27)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 28)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 29)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 30)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 31)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((32 : Fin 40) < 32)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_33), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_34), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_35), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_36), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_37), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_32_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
