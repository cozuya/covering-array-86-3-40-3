import CA86.Certificate
import CA86.Checker
import CA86.Blocks.Block23

namespace CA86
set_option maxRecDepth 100000
set_option maxHeartbeats 0

private def ws_26_27 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  160585845592654792620605283077132082270707075161012600960,
  154408718286893661243924150437583582575057888874751623296,
  148374145895797492976239798854987140702393139566791917696,
  149055165033650214427158872383820644609549060820716720128,
  160538323405770769996949142971634444002686608988084125952,
  148374140072803940593267987003080941508814809279424921728,
  160585839769661207825738022005836788385073733972969685120,
  148326626654398672792897577392839892067856305211603697920,
  160585842647169590178313100281359841528479127122311413888,
  168056755810267173628026878876664571833042864795867124992,
  154408715409385311303244521381449624123489671177044000896,
  148374184191709456421183185068734051653367131551192600576
]

private theorem checked_26_27 : checkPair certificate 26 27 ws_26_27 = true := by decide +kernel

private theorem pair_26_27 : PairCovered certificate 26 27 :=
  checkPair_sound checked_26_27

private def ws_26_28 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  167193224963829826425786335891734861968087927277213978112,
  142242281318945648254119874851531123004609303949816677120,
  160346024797657971359131252377348030410954884998202704640,
  160346007328677314216196977719288699070528605705467904768,
  166480567622109361017874036384964900798688377663042031616,
  160488556420348627702563614821895732217689980660124582272,
  123710917074561022604042280982905043266037694376026620672,
  160346016165120378133599882893894531725903877646472758016,
  141957191972045987957122000117136114787642445365470396800,
  123710925707086169661721150221120265519335517042681889536,
  123853534537641329488843133597224914708880641895592640896
]

private theorem checked_26_28 : checkPair certificate 26 28 ws_26_28 = true := by decide +kernel

private theorem pair_26_28 : PairCovered certificate 26 28 :=
  checkPair_sound checked_26_28

private def ws_26_29 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  117532675967536564323650353463860090036368380777587589888,
  154167775058108366021060455620087854927987748733108404992,
  117532667335011417265971484225644867783070558110932321024,
  168054876339498474893015167171800215844892956181111018112,
  117675216222764813892660448128176822467474460442374537600,
  136064049048364253891130852507092002431607192237025313536,
  136064031579396042916049078094270947521642167684722377472,
  135778942232496382619051203359875939304675309100376097152,
  154167766425570772795529086136634356242936741381378458368,
  326189277474714777365020522537813923861385478045550117248
]

private theorem checked_26_29 : checkPair certificate 26 29 ws_26_29 = true := by decide +kernel

private theorem pair_26_29 : PairCovered certificate 26 29 :=
  checkPair_sound checked_26_29

private def ws_26_30 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  148038172885247528617263227251785680094478187135965922304,
  117627714586814700230342552923148747040633709874901025280,
  148228215048835070408506376227169357257739179310157267456,
  117580198154951623442346624776635219334605089666924348416,
  148228226558872748541424189411008118808464822134175302144,
  167623862356129085586510414891567331115981863138359941376,
  141908553174898080248109874800688639847355961858389574144,
  166435991821995248105817192493311073054829299579683805440,
  148419814989771022488903316965861333758376373809523529984
]

private theorem checked_26_30 : checkPair certificate 26 30 ws_26_30 = true := by decide +kernel

private theorem pair_26_30 : PairCovered certificate 26 30 :=
  checkPair_sound checked_26_30

private def ws_26_31 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  160538317513203074490706435830081232941839412984421564672,
  148374131234755223781224311469992452896175855962094076032,
  160585833809120873366269424748271352915840173804980568192,
  148326620693858338333413524939156477539649959449824608512,
  160585830931612491013694346472748299772434780655638839424,
  167625811201627138184990997667091481536707066951776015616,
  154408712394325998151555157618520785727112169745371136128,
  148374137423137154167829530852570132004367322840983165184
]

private theorem checked_26_31 : checkPair certificate 26 31 ws_26_31 = true := by decide +kernel

private theorem pair_26_31 : PairCovered certificate 26 31 :=
  checkPair_sound checked_26_31

private def ws_26_32 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  129981957416400301935144410669625802954623527152152298368,
  118210658401652246162131532339833390522022940637160708480,
  167240743908184113172945533288306810285442299046530667776,
  160392409959808068175713735413827296733618915780509942400,
  129649337182127162862694351912168690386733139947681858176,
  129649331427110495393215087823171889116461094410110747264,
  221931678518898284912465285154835290284043810055725425792
]

private theorem checked_26_32 : checkPair certificate 26 32 ws_26_32 = true := by decide +kernel

private theorem pair_26_32 : PairCovered certificate 26 32 :=
  checkPair_sound checked_26_32

private def ws_26_33 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  129600710167438655250038588740848022512973940756494516608,
  147989516687626820350089518200923531501780398532640948992,
  111354435066035675795613690702755097950587309869854933760,
  129600701330995494091014540598770947218894238192643441024,
  129885790677895154388012415333165955435861096776989721344,
  148419408693242719030793203951291812588343108430791246208
]

private theorem checked_26_33 : checkPair certificate 26 33 ws_26_33 = true := by decide +kernel

private theorem pair_26_33 : PairCovered certificate 26 33 :=
  checkPair_sound checked_26_33

private def ws_26_34 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  167192911494358637763437350380991456114260788514493321216,
  160392398381801899812187532195722859751610979018816471680,
  129649340059635545215253974991573764471165747503233614464,
  129649346018570324021718400054245765680812842511532933760,
  191281814583083980265641886192275834074515193993381351424
]

private theorem checked_26_34 : checkPair certificate 26 34 ws_26_34 = true := by decide +kernel

private theorem pair_26_34 : PairCovered certificate 26 34 :=
  checkPair_sound checked_26_34

private def ws_26_35 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  135826449964396988257347996033308841611552356712489009792,
  135826464419911441737747474672651068602912017989712855680,
  123757319705691776569493831134709194255360953113951453824,
  123901023589729545521559709612140024002566835584136696960
]

private theorem checked_26_35 : checkPair certificate 26 35 ws_26_35 = true := by decide +kernel

private theorem pair_26_35 : PairCovered certificate 26 35 :=
  checkPair_sound checked_26_35

private def ws_26_36 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  135731425937113801373041295900778422442366505913122161152,
  167671384545668290679385318112137396074760934301356201728,
  221931304374290965748937314936147467667929310180824650368
]

private theorem checked_26_36 : checkPair certificate 26 36 ws_26_36 = true := by decide +kernel

private theorem pair_26_36 : PairCovered certificate 26 36 :=
  checkPair_sound checked_26_36

private def ws_26_37 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  129839396677148676962027408583206614253491730771509018752,
  221980317292665125088261731534593388675814289462966374400
]

private theorem checked_26_37 : checkPair certificate 26 37 ws_26_37 = true := by decide +kernel

private theorem pair_26_37 : PairCovered certificate 26 37 :=
  checkPair_sound checked_26_37

private def ws_26_38 : Array Nat := #[
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  123900614986027470975115755047314712124139853222456136320
]

private theorem checked_26_38 : checkPair certificate 26 38 ws_26_38 = true := by decide +kernel

private theorem pair_26_38 : PairCovered certificate 26 38 :=
  checkPair_sound checked_26_38

theorem block_26 : ∀ j : Fin 40, (26 : Fin 40) < j → PairCovered certificate 26 j :=
  (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 0)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 1)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 2)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 3)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 4)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 5)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 6)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 7)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 8)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 9)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 10)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 11)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 12)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 13)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 14)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 15)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 16)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 17)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 18)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 19)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 20)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 21)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 22)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 23)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 24)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 25)) h)), (Fin.forall_fin_succ.mpr ⟨(fun h => False.elim ((by decide : ¬ ((26 : Fin 40) < 26)) h)), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_27), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_28), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_29), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_30), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_31), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_32), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_33), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_34), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_35), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_36), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_37), (Fin.forall_fin_succ.mpr ⟨(fun _ => pair_26_38), (Fin.forall_fin_succ.mpr ⟨(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj)), (by intro x; exact Fin.elim0 x)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)⟩)

end CA86
