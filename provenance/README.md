# Lean handoff with CA86 naming

[lean/ca86-lean-handoff.zip](lean/ca86-lean-handoff.zip) preserves the complete
source handoff from `/home/cozuya/ca86-lean` with project labels, the Lean namespace,
and theorem names adapted to `CA86`. Its recalculated
[archive checksum](lean/ca86-lean-handoff.zip.sha256),
[source manifest](lean/SHA256SUMS), [README](lean/README.md),
[HANDOFF](lean/HANDOFF.md), and [verification logs](lean/logs) are also preserved
separately for convenient inspection.

Every adapted Lean file, the canonical matrix, and the Lean/Lake configuration
are byte-identical to the corresponding files at the repository root. The package
checker enforces this comparison against the ZIP.

The generator and verification helpers with updated names are included inside the ZIP.
The repository's generator lives at `scripts/generate.py` and resolves the project
root one directory above the script. The repository's verifier
adds exact-statement checks, source manifests, independent matrix checks, and
evidence under `.build/`. [../PROVENANCE.md](../PROVENANCE.md) describes the source
and evidence boundaries. Archived documentation and logs use adapted labels;
fresh verification of the renamed proof is recorded under `evidence/`.
