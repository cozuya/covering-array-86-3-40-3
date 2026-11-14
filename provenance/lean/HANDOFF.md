> Adapted handoff copy: project labels, the Lean namespace, and theorem names use CA86. Historical logs have adapted display names; their timings are historical. The matrix entries are unchanged. Fresh verification of the renamed proof is in the main repository evidence/ directory.

**LEAN VERIFIED:** Complete kernel-checked proof of CAN(3,40,3) ≤ 86.

Lean **4.28.0**, pinned as `leanprover/lean4:v4.28.0`, commit
`7e01a1bf5c70fc6167d49c345d3bf80596e9a79b`.

The exact main statements, in namespace `CA86`, are:

```lean
theorem ca86_covering : IsCoveringArray certificate
theorem CAN_3_40_3_le_86 : CAN₃ 40 3 ≤ 86
```

Here `certificate : Fin 86 → Fin 40 → Fin 3` is the original matrix.
`IsCoveringArray` quantifies every increasing column triple, all three symbols,
and a matching row. `CAN₃` is the least feasible row count for strength three;
`CAN_3_40_3_spec` proves its feasibility and minimality for these parameters.

All **266,760** coverage requirements are verified by kernel reduction using
`decide +kernel`, with generated row witnesses and a proved Boolean-checker
soundness theorem. The construction is packed without changing any entry.
There is no `sorry`, added axiom, unsafe proof shortcut, or native evaluation
in these proofs. Python supplies authenticated data and witnesses, not axioms.

Actual `#print axioms` results:

- Covering theorem, existence theorem, and checker soundness: `[propext, Quot.sound]`.
- Numerical CAN bound and minimum semantics: `[propext, Classical.choice, Quot.sound]`.
- Negative-control theorems: `[propext]`.

These are standard Lean foundational axioms. No Mathlib or third-party packages
are required; reproduction needs the pinned Lean toolchain, Python 3, Bash,
and Linux/WSL. Toolchain binaries are not included in the ZIP.

Run `/home/cozuya/ca86-lean/verify.sh`. It completed successfully, including:

- Warning-free clean build: `lake --wfail build CA86 CA86.Negative`, exit 0,
  **54.46 seconds**.
- Build memory: largest process **1.58 GiB** peak RSS;
  sampled process-tree peak **3.49 GiB PSS**
  (**4.29 GiB summed RSS**, including shared-page duplication).
- Fresh kernel replay: `lake env leanchecker --fresh CA86`, exit 0,
  **158.633 seconds**; largest process
  **0.56 GiB** peak RSS.
- Separate all-zero 86×40 control: proved non-covering and checker-false;
  an attempted checker-true proof was rejected by Lean as false.

The unchanged certificate's SHA-256 is:

```text
7dc7ab1e231dce3cde5cc1c6b35c4911f34145fd4dfe5d80f8ea26b235b27f8a
```

Everything is under **`/home/cozuya/ca86-lean/`**:

- `CA86.lean`, `CA86/Basic.lean`, `CA86/Certificate.lean`, `CA86/Checker.lean`,
  `CA86/Blocks/Block00.lean` through `Block39.lean`: complete proof and data.
- `CA_86_3_40_3.txt`: unchanged original certificate.
- `generate.py`, `verify.sh`, `measure.py`, `package.py`: generation,
  reproducible verification, resource measurement, and packaging.
- `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`: minimal pinned project.
- `CA86/Negative.lean`, `tests/NegativeMustFail.lean`, `Audit.lean`: controls/audit.
- `README.md`, `HANDOFF.md`, `logs/`, `SHA256SUMS`: documentation and evidence.
- **`/home/cozuya/ca86-lean/ca86-lean-handoff.zip`**: complete source handoff,
  with archive checksum in `ca86-lean-handoff.zip.sha256`.

This proves the mathematical upper bound using the explicit construction.
It does **not** prove that 86 is optimal or exclude a construction with 85 rows.
