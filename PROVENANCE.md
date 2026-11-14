# Provenance

**Chris Ozols, with AI-assisted construction, verification, and formalization.**
Chris supplied the construction, Lean handoff, and prior-art audit and directed the
repository preparation. The handoff does not identify the exact model or individual
proof authors; no more specific formalization attribution is asserted here.
OpenAI Codex prepared this repository layout, documentation, additional statement
checks, independent matrix cross-check, and integrity checks.

## Construction lineage

The supplied claim and prior-art report describe CA86's November 14, 2026
construction as postoptimization of Bai XunDi's published 87×40 array, building on
Kianoosh Shokri and Lucia Moura's strength-three LFSR construction lineage.
The reported approach uses row deletion, tabu repair, and structure-aware block
swapping. The original search implementation, seeds, and intermediate candidates
were not supplied with this Lean handoff. Verification checks the final explicit
witness and does not rerun that search.

Bai's original October 30 dataset is identified by
DOI [10.5281/zenodo.23787055](https://doi.org/10.5281/zenodo.23787055).
Shokri–Moura's paper is
[New Families of Strength-3 Covering Arrays Using Linear Feedback Shift Register Sequences](https://doi.org/10.1002/jcd.21963).
[PRIOR_ART.md](PRIOR_ART.md) distinguishes the 86×39 near miss from the 87×40 parent.

## Supplied artifacts

| Artifact | Supplied source | Included copy |
| --- | --- | --- |
| Lean source project | `/home/cozuya/ca86-lean` | Root proof files and [adapted handoff ZIP](provenance/lean/ca86-lean-handoff.zip) |
| Lean handoff documentation and checksums | Same project | [provenance/lean/](provenance/README.md) |
| Historical verification logs and measurements | Same project's `logs/` | [provenance/lean/logs/](provenance/lean/logs) |
| Prior-art report | PDF supplied by Chris from Downloads | [Rebuilt PDF](prior-art/CA86_Prior_Art_Report.pdf) |
| Prior-art audit evidence | ZIP supplied by Chris from Downloads | [Adapted ZIP](prior-art/CA86_Audit_Evidence.zip) and [complete extraction](prior-art/audit) |

The Lean handoff says its source matrix was extracted from the user's
`independent_review.zip`. That earlier archive was not part of this packaging task;
the matrix bytes are authenticated against the handoff's recorded hash.

At Chris's request, project labels, filenames, the Lean namespace, and the covering
and existence theorem names now use `CA86`. The same changes were applied to the
handoff ZIP, historical logs, prior-art evidence ZIP, and report source. The PDF
was rebuilt from that source and archive manifests were recalculated. These are
adapted copies of the supplied artifacts. Numerical data, prior-art findings, source
attribution, and licenses are unchanged.

The repository's Lean files, canonical matrix, and Lean/Lake configuration match
the adapted handoff ZIP, including all 40 generated proof blocks and the negative
control. The package checker verifies this directly. The generator, verifier,
measurement helper, and packaging script are included in the archive.

## Repository adaptations

- `scripts/generate.py` is the original generator with its project-root lookup
  adjusted for the `scripts/` directory and declaration names updated to `CA86`.
  The matrix entries and checker logic are unchanged.
- `scripts/measure.py` is unchanged from the handoff.
- [Verification.lean](Verification.lean) adds explicit quantified statement and
  minimum-semantics checks. [Audit.lean](Audit.lean) uses the renamed declarations.
- [verify.sh](verify.sh) uses local `.build/` outputs, adds source integrity checks
  and an independent matrix cross-check, and records source-bound evidence.
- The adapted Lean handoff is included separately. Its historical documentation
  and logs have updated project labels; the new proof replay is recorded in `evidence/`.
- The repository structure follows
  [gyires-permanent-4x4](https://github.com/cozuya/gyires-permanent-4x4), with separate
  readable proof, reproduction, prior-art, provenance, and verification reports,
  plus `original/`, `provenance/`, `crosscheck/`, `scripts/`, and `evidence/`.
  The Apache license and checksum-pinned Lean installer were adapted from it.

## Evidence and dates

The supplied handoff and prior-art review are dated November 14, 2026. Their
timestamps are provenance records, not authenticated discovery or publication
timestamps. The audit cutoff is fixed even if live record tables later change.
The project-page link is the intended publication destination:
[cozuya.github.io/improvements/covering-array-86-3-40-3](https://cozuya.github.io/improvements/covering-array-86-3-40-3).

[evidence/verification.json](evidence/verification.json) records the fresh verification
of this repository, including time, platform, source hashes, toolchain pins, and
resource measurements. The source identity is [SOURCE_SHA256SUMS](SOURCE_SHA256SUMS).
Historical logs with adapted declaration names are retained separately, so the fresh
run is distinguishable from the source handoff's earlier verification.

Hashes identify bytes. A clean Lean build and fresh kernel replay establish the
stated theorem relative to Lean's standard foundations; they do not establish
historical priority or optimality. The prior-art report's candidate-verification
boundary is preserved rather than retroactively changed.

## Attribution and licenses

The original proofs, scripts, and repository documentation use Apache-2.0, matching
the reference repository's convention. The predecessor data and source records
retain Bai's CC BY 4.0 terms, and ca-tools retains its MIT notice. The supplied
audit material preserves its own source attribution and third-party terms.
See [NOTICE](NOTICE), [original/README.md](original/README.md), and the audit's
[original attribution statement](prior-art/audit/README.txt).
