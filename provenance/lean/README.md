> Adapted handoff copy: project labels, the Lean namespace, and theorem names use CA86. Historical logs have adapted display names; their timings are historical. The matrix entries are unchanged. Fresh verification of the renamed proof is in the main repository evidence/ directory.

# CA86 CA(86;3,40,3): Lean 4 certificate

This project proves **CAN(3,40,3) ≤ 86** using the unchanged explicit matrix
in `CA_86_3_40_3.txt`. It does not run the original search. It does not prove
optimality or exclude an 85-row construction.

## Exact propositions

All declarations below are in namespace `CA86`.

```lean
def IsCoveringArray {n k v : Nat} (A : Fin n → Fin k → Fin v) : Prop :=
  ∀ i j l : Fin k, i < j → j < l →
    ∀ a b c : Fin v, ∃ r : Fin n,
      A r i = a ∧ A r j = b ∧ A r l = c

theorem ca86_covering : IsCoveringArray certificate

theorem ca86_existence : Feasible 86 40 3

theorem CAN_3_40_3_le_86 : CAN₃ 40 3 ≤ 86
```

`certificate : Fin 86 → Fin 40 → Fin 3` fixes the dimensions and alphabet.
`Feasible n k v` means that some such n-row array has the stated property.
`CAN₃ k v` is the least feasible row count for strength three, defined by
well-ordering of the natural numbers and classical choice. Its fallback is zero
only when no feasible row count exists. The proved theorem `CAN_3_40_3_spec`
ensures that, for these parameters, CAN₃ is itself feasible and is less than or
equal to every feasible row count. Thus the numerical inequality has the usual
covering-array-number semantics.

There are 9,880 increasing column triples and 27 assignments per triple.
All 266,760 requirements are checked.

## Reproduce

Use Linux/WSL, Python 3, Bash, and the pinned **Lean 4.28.0** release
(`leanprover/lean4:v4.28.0`, commit
`7e01a1bf5c70fc6167d49c345d3bf80596e9a79b`). No Mathlib, other Lake packages,
Python packages, network access, or search program is required for verification.
The Lean toolchain binaries are not bundled. With elan, install the version
named in `lean-toolchain`; an existing matching standalone installation also works.

```bash
cd ~/ca86-lean
./verify.sh
# For a standalone installation elsewhere:
LEAN_BIN=/absolute/path/to/lean-4.28.0-linux/bin ./verify.sh
```

`verify.sh` authenticates the source file, compares deterministic generated
sources, audits proof code, deletes Lake outputs, and performs a warning-free
clean build. It prints theorem axioms, replays all declarations of `CA86` and
its imports into a fresh kernel environment with `leanchecker --fresh CA86`,
and requires the invalid negative-control proof to fail. Logs and resource
measurements are written to `logs/`.

The standalone build command is `lake --wfail build CA86 CA86.Negative`.
`lake build` also builds the library. Three import chains bound concurrent
proof compilation to three Lean processes, each using `-j1`. Measurements from
the completed clean verification are in `HANDOFF.md` and `logs/*-metrics.json`.
Tree RSS measurements sum resident memory across processes and double-count
shared pages; tree PSS apportions those shared pages. Both are sampled at 0.2 s.
The single-process high-water RSS is also reported.

## Verification architecture

`generate.py` validates the exact SHA-256, 86 rows, 40 columns, and ternary
symbols. The original bytes are never rewritten. It embeds all 3,440 entries in
one immutable natural-number numeral as two-bit fields in row-major order:
entry `(r,c)` occupies bits `2*(40*r+c)` and `2*(40*r+c)+1`. It checks every
field against the original matrix before emitting source. `certificate` uses
natural-number shifts and masks to decode those fields. The final `% 3`
constructs an element of `Fin 3`; all original fields already lie in {0,1,2}.

For each increasing pair of first and second columns, the generator supplies
one row witness for each permitted third column and each ternary assignment.
Twenty-seven witnesses are packed into seven-bit fields per third column.
The generator supplies data, not trusted proofs. `checkPair` inspects the three
actual matrix entries for each proposed witness. A generic proved theorem,
`checkPair_sound`, converts `checkPair ... = true` into the quantified existence
of matching rows. In each proof block, **`by decide +kernel`** checks that the
Boolean equals true using Lean kernel reduction. Finite case decomposition then
assembles the 40 blocks into the global theorem.

The ordinary proof `CAN₃_le_of_feasible` converts the verified construction to
the numerical upper bound. No native evaluation, new covering axiom, incomplete
proof, or unsafe proof mechanism is used in these sources. Standard Lean
toolchain executables are used to compile and replay them.

## Axioms and trust

The actual `#print axioms` output is preserved in `logs/axioms.log`:

| Result | Axioms |
|---|---|
| `checkPair_sound` | `propext`, `Quot.sound` |
| `ca86_covering` | `propext`, `Quot.sound` |
| `ca86_existence` | `propext`, `Quot.sound` |
| `CAN_3_40_3_le_86` | `propext`, `Classical.choice`, `Quot.sound` |
| `CAN_3_40_3_spec` | `propext`, `Classical.choice`, `Quot.sound` |
| Both successful negative-control theorems | `propext` |

These are standard Lean foundations. There is no `sorryAx`, native evaluation
axiom, or user-added axiom in the theorem dependencies. Trust rests on Lean's
kernel, these foundational axioms, and faithful identification of the embedded
data with the authenticated source certificate. The deterministic generator,
field-by-field round trip, and SHA-256 check make that data identification
reproducible; Python's coverage computation is not a premise of any Lean proof.

## Negative control

`CA86/Negative.lean` defines a separate all-zero 86×40 matrix. Lean proves
both that it is not a covering array and that the same checker returns false.
`tests/NegativeMustFail.lean` attempts to prove that its checker returns true;
Lean rejects it with “Tactic `decide` proved that the proposition ... is false”.
That deliberately failing file is outside the library build. Its expected
rejection is part of `verify.sh`. The original certificate is never altered.

## Files

- `CA_86_3_40_3.txt`: unchanged authenticated construction.
- `CA86/Basic.lean`: covering property, feasibility, least-row-count semantics.
- `CA86/Certificate.lean`: generated immutable construction.
- `CA86/Checker.lean`: checker and its proved soundness.
- `CA86/Blocks/Block00.lean` through `Block39.lean`: generated witness checks.
- `CA86.lean`: main covering, existence, numerical bound, and minimum semantics.
- `CA86/Negative.lean`, `tests/NegativeMustFail.lean`: negative controls.
- `Audit.lean`: theorem signatures and axiom reports.
- `generate.py`: deterministic source/witness generation; `--check` compares.
- `verify.sh`, `measure.py`: complete clean verification and measurements.
- `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`: pinned minimal project.
- `logs/`: clean build, kernel replay, axiom audit, negative rejection, metrics.
- `HANDOFF.md`: concise completed-result report.
- `SHA256SUMS`: hashes of packaged artifacts.
- `package.py`: create the handoff ZIP without build caches or toolchain binaries.

Regeneration is optional: `python3 generate.py` rewrites generated sources only;
`python3 generate.py --check` verifies they already match. All supplied generated
sources can be compiled without running the generator.

Certificate SHA-256:

```text
7dc7ab1e231dce3cde5cc1c6b35c4911f34145fd4dfe5d80f8ea26b235b27f8a
```

The source was extracted from the user's
`C:\Users\Chris\Downloads\independent_review.zip` on November 14, 2026.
Its hash was checked before toolchain inspection or proof development.
