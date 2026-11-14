# Verification report

This repository includes a fresh verification of the complete CA(86;3,40,3) Lean
project. Its machine-readable record is [evidence/verification.json](evidence/verification.json);
the complete transcript is [evidence/verification.log](evidence/verification.log).
The run identifies its inputs through [SOURCE_SHA256SUMS](SOURCE_SHA256SUMS).

This run verifies the renamed `CA86` namespace and declarations. The archived
handoff and prior-art copies have matching project labels and regenerated manifests;
their adaptation is documented in [PROVENANCE.md](PROVENANCE.md).

## Checks

- Lean sources, matrix, and configuration match the adapted archived handoff.
- Every adapted prior-art ZIP member and its extracted copy match byte for byte.
- The source manifest and regenerated audit manifest validate.
- The generator authenticates the matrix and confirms all generated sources match.
- The proof-source audit inventories all kernel pair checks.
- A clean, warning-free Lean build checks all proof blocks and negative-control theorems.
- Exact quantified statements and nine theorem axiom sets are checked.
- Fresh kernel replay checks the main theorem's complete import closure.
- The intentionally false checker-true proof is rejected for the expected reason.
- Independent Python enumeration checks all 266,760 requirements and rejects an all-zero control.

## Fresh run measurements

| Check | Elapsed | Peak process RSS | Peak tree PSS |
| --- | --- | --- | --- |
| Clean build | 55.449 s | 1.59 GiB | 3.55 GiB |
| Statement and axiom audit | 0.612 s | 0.44 GiB | 0.47 GiB |
| Fresh kernel replay | 157.789 s | 0.57 GiB | 0.59 GiB |

## Toolchain and trust

Lean 4.28.0, commit `7e01a1bf5c70fc6167d49c345d3bf80596e9a79b`, with no Mathlib,
other Lean packages, or Python packages. [TOOLCHAIN.json](TOOLCHAIN.json) records
the Linux release archive and its checksum.

| Declaration in `CA86` | Complete axiom set |
| --- | --- |
| `checkPair_sound` | `propext`, `Quot.sound` |
| `ca86_covering` | `propext`, `Quot.sound` |
| `ca86_existence` | `propext`, `Quot.sound` |
| `CAN_3_40_3_le_86` | `propext`, `Classical.choice`, `Quot.sound` |
| `CAN_3_40_3_spec` | `propext`, `Classical.choice`, `Quot.sound` |
| `zeroArray_not_covering` | `propext` |
| `zeroArray_checker_rejected` | `propext` |
| `Verification.exact_statement` | `propext`, `Quot.sound` |
| `Verification.exact_bound` | `propext`, `Classical.choice`, `Quot.sound` |

The exact output is in [evidence/kernel-check.log](evidence/kernel-check.log).
There is no `sorryAx`, native-evaluation axiom, compiler-trust axiom, or user-added
axiom in these dependencies. The finite checks use `decide +kernel`.

## Evidence files

| File | Purpose |
| --- | --- |
| [verification.json](evidence/verification.json) | Run identity, source hashes, toolchain, checks, and resource measurements |
| [verification.log](evidence/verification.log) | Complete fresh verification transcript |
| [kernel-check.log](evidence/kernel-check.log) | Printed theorem signatures and exact axiom reports |
| [negative-control.log](evidence/negative-control.log) | Expected rejection of the invalid Lean proof |
| [crosscheck.json](evidence/crosscheck.json) | Independent matrix verification, witness multiplicities, and row essentiality |
| [crosscheck.log](evidence/crosscheck.log) | Cross-check and Python negative-control success |
| [build-metrics.json](evidence/build-metrics.json) | Clean build timing and memory |
| [audit-metrics.json](evidence/audit-metrics.json) | Exact-statement/axiom check timing and memory |
| [replay-metrics.json](evidence/replay-metrics.json) | Fresh kernel replay timing and memory |
| [prior-art-reproduction.json](evidence/prior-art-reproduction.json) | Fresh reproduction of the supplied table audit, six prior arrays, and scheme closure |

The handoff's historical verification evidence, with declaration names adapted, is in
[provenance/lean/logs/](provenance/lean/logs). The fresh run's timing and memory are
recorded directly in the JSON files above. Memory sampling runs every 0.2 seconds;
tree RSS double-counts shared pages, whereas PSS apportions them.

The supplied finite prior-art calculations were also rerun in a scratch copy.
The table-audit JSON, six-array checks, and scheme-closure output all match the
original recorded results. This reproduces fixed-data arithmetic and predecessor
verification; it does not repeat the literature or web searches.

The independent matrix check also finds every row essential within this fixed
construction: each row uniquely witnesses at least 30 interactions. This rules out
deleting a row without changing the remaining entries. It does not exclude a
different 85-row construction.

## Scope

The formal result is `CAN(3,40,3) ≤ 86` for the authenticated explicit matrix.
Verification establishes neither optimality nor historical priority. The supplied
prior-art audit independently assesses the earlier literature and published arrays;
it did not receive this candidate. See [PRIOR_ART.md](PRIOR_ART.md) and
[REPRODUCE.md](REPRODUCE.md) for those boundaries and reproduction commands.
