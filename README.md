# A Covering Array with 86 Rows, 40 Columns, and Three Symbols

**By Chris Ozols, with AI-assisted construction, verification, and formalization.**

This repository exhibits an explicit **CA(86; 3, 40, 3)** and proves in **Lean 4.28.0** that

```math
\mathrm{CAN}(3,40,3) \le 86.
```

Every choice of three of its 40 columns contains all 27 ternary assignments among
the 86 rows. The construction improves the **best previously located public upper
bound from 87 to 86**, according to the supplied prior-art audit with research cutoff
November 14, 2026. It does not establish that 86 is optimal.

The construction was obtained by postoptimizing **Bai XunDi's 87-row extension of the
Shokri–Moura lineage**. The numerical improvement is the contribution claimed here;
row deletion, tabu repair, and postoptimization have established prior art.

> **Trust model.** All 266,760 coverage requirements are checked by Lean kernel
> reduction using `decide +kernel`. The covering theorem depends only on `propext`
> and `Quot.sound`; the numerical minimum additionally uses `Classical.choice`.
> There is no `native_decide`, compiler-trust axiom, `sorry`, or added axiom in these
> proofs. No Mathlib or other Lean package is required.

[Project page](https://cozuya.github.io/improvements/covering-array-86-3-40-3) ·
[Readable proof](PROOF.md) · [Main Lean theorem](CA86.lean) ·
[Explicit matrix](CA_86_3_40_3.txt) · [Exact-statement check](Verification.lean) ·
[Local verification evidence](evidence/verification.log) ·
[Verification report](VERIFICATION_REPORT.md) · [Provenance](PROVENANCE.md) ·
[Prior art](PRIOR_ART.md) · [Citation](CITATION.cff)

## What is proved

A covering array of strength three requires every assignment on every three distinct
columns to occur in some row. `CAN(3,k,v)` denotes the least number of rows of such an
array with `k` columns and `v` symbols. Here there are
9,880 increasing column triples and 27 assignments per triple.

| Statement | Status | Lean declaration in `CA86` |
| --- | --- | --- |
| The supplied 86×40 ternary matrix covers all triples | Formalized | `ca86_covering` |
| An 86-row construction exists | Formalized | `ca86_existence` |
| CAN(3,40,3) ≤ 86 | Formalized | `CAN_3_40_3_le_86` |
| The defined CAN is feasible and minimal | Formalized | `CAN_3_40_3_spec` |
| The all-zero 86×40 matrix fails coverage and the checker | Formalized negative control | `zeroArray_not_covering`, `zeroArray_checker_rejected` |
| Optimality of 86 or impossibility of 85 rows | Not established | — |

The exact covering statement is:

```lean
∀ i j l : Fin 40, i < j → j < l →
  ∀ a b c : Fin 3, ∃ r : Fin 86,
    certificate r i = a ∧ certificate r j = b ∧ certificate r l = c
```

Increasing column indices suffice because any three distinct columns can be sorted
and their assigned symbols permuted with them. [Verification.lean](Verification.lean)
restates these dimensions and quantifiers explicitly and checks the numerical
bound together with its least-row-count semantics.

## Proof overview

1. Embed the unchanged 3,440 matrix entries in a natural-number numeral using
   two bits per entry. The generator authenticates the source matrix and verifies
   every decoded field against it.
2. Supply a row witness for each of the 266,760 required interactions. Witnesses
   are data; the checker reads the actual entries in the embedded matrix.
3. Prove the Boolean checker's soundness. Check all 741 nonvacuous first/second
   column pairs by kernel reduction, split across 40 generated modules.
4. Assemble the quantified covering theorem and deduce the upper bound from
   feasibility and the ordinary well-ordering of the natural numbers.

[PROOF.md](PROOF.md) explains the argument and data encoding. An independent
[Python cross-check](crosscheck/README.md) enumerates the interactions directly from
the text file, without using the packed Lean certificate or supplied row witnesses.

## Reproduce the verification

On Linux x86_64 / WSL with Python 3, Bash, curl, tar, and coreutils:

```sh
git clone https://github.com/cozuya/covering-array-86-3-40-3.git
cd covering-array-86-3-40-3
bash scripts/install-lean.sh
export PATH="$PWD/.tools/lean-4.28.0-linux/bin:$PATH"
./verify.sh
python3 scripts/check-package.py
```

If Lean 4.28.0 is already installed, use `LEAN_BIN=/absolute/path/to/bin ./verify.sh`.
The installer authenticates the Linux release archive against [TOOLCHAIN.json](TOOLCHAIN.json).
Verification after toolchain installation needs no network or third-party packages.

`./verify.sh` checks source hashes and deterministic generation, performs a warning-free
clean build, audits the exact theorem statements and axioms, replays `CA86` and all
imports in a fresh kernel, requires the deliberately invalid Lean proof to fail, and
runs the independent cross-check with its own negative control. Local outputs go to
`.build/`; reviewed evidence is committed under [evidence/](evidence).
See [REPRODUCE.md](REPRODUCE.md) for the individual commands and memory needs.

Verification runs locally using the commands above. No build cache or toolchain
binary is committed.

## Prior art and provenance

The supplied [13-page report](prior-art/CA86_Prior_Art_Report.pdf) and
[complete audit evidence](prior-art/README.md) locate an exact-target 87-row predecessor
in [Bai's October 30, 2026 dataset](https://doi.org/10.5281/zenodo.23787055).
The same deposit includes an 86-row construction with **39** columns, which falls one
column short. The underlying [Shokri–Moura construction](https://doi.org/10.1002/jcd.21963)
gives 87 rows and 39 columns at its ternary specialization.

The audit's verdict is **LIKELY NOVEL**, within its documented search scope and access
limits. It did not receive the candidate matrix; this repository supplies that matrix
and its separate formal verification. Historical priority is not a Lean theorem.
[PRIOR_ART.md](PRIOR_ART.md) distinguishes the numerical record, the witness, and the
search method. [PROVENANCE.md](PROVENANCE.md) records the supplied artifacts and
includes the complete Lean handoff with project labels adapted to `CA86`.

Canonical certificate SHA-256:

```text
7dc7ab1e231dce3cde5cc1c6b35c4911f34145fd4dfe5d80f8ea26b235b27f8a
```

## Repository layout

| Path | Contents |
| --- | --- |
| `CA86.lean`, `CA86/` | Full Lean proof, packed certificate, sound checker, and all 40 proof blocks |
| `Audit.lean`, `Verification.lean`, `tests/` | Statement and axiom audits; negative controls |
| `scripts/`, `verify.sh`, `TOOLCHAIN.json` | Generation, installation, verification, and package integrity |
| `crosscheck/` | Independent exhaustive verification of the text matrix |
| `evidence/` | Fresh verification transcript, source identities, and measurements |
| `original/` | Published 87-row parent and its attribution |
| `provenance/lean/` | Lean handoff, documentation, checksums, and historical logs with names adapted to CA86 |
| `prior-art/` | Prior-art PDF, evidence ZIP, and complete extracted audit with names adapted to CA86 |

## License

Copyright 2026 Chris Ozols. The original Lean proofs, scripts, and documentation are
licensed under the [Apache License, Version 2.0](LICENSE). Third-party material retains
its own terms: Bai's reproduced arrays and records are CC BY 4.0; the preserved
ca-tools material includes its MIT notice. See [NOTICE](NOTICE) for attribution and
the treatment of the supplied audit material.
