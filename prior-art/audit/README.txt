Adapted copy: project labels and filenames use CA86. The report was rebuilt from its source and the package manifest recalculated. Numerical findings, third-party data, credit, and licenses are unchanged.

CA86 CA(86;3,40,3) — PRIOR-ART AUDIT
Research cutoff: November 14, 2026
Verdict: LIKELY NOVEL

START HERE
report.txt is the complete report in plain text; source_index.json maps S01–S39.
The separately delivered PDF is the formatted report.
claim_brief.txt is the user's supplied claim; the candidate 86×40 matrix and
search code were not attached. This bundle does not certify that missing file.

REPRODUCE THE COMPUTATIONAL AUDIT
From this extracted directory, with Python3 and no third-party packages:
    python3 audit_tables.py inputs reproduced_audit.json
    python3 lineage/verify_prior_arrays.py
    python3 lineage/check_published_scheme_closure.py

The first command reads fixed CSV snapshots and the original published87×40.
It computes all orders of ordinary CKRS fusion and derivation retaining at least
strength3,40columns and3symbols, then checks the original array exhaustively.
The second independently checks six prior arrays against the original manifest.
The third closes only the documented scheme recurrences under optimistic
ingredient costs. Its costs are a relaxation, NOT a valid upper-bound table.
No script searches for or constructs a new array.

WHAT IS INCLUDED
inputs/: pinned ca-tools frame/provenance/derived table, historical catalogue,
         original Bai records and original87×40.
audit_results.json: finite table scan and original-array unique-witness counts.
lineage/: original six neighboring arrays, dataset version/file metadata,
          independent checks, scheme convention notes, query log and hashes.
literature/: finalized primary-source index, historical table, discovery screens.
repositories/: external family data, repository state metadata, query log,
               download hash manifest and final independent red-team review.
provenance/: pinned/current commit metadata, inspected submission discussions,
             claim CSV, PLOS header scan, discovery summary, contributor policy.
search_log_root.json: consolidated root queries/retrieval groups and limits.
report_build/: report generator and packaging recipe. The generator additionally
               requires reportlab and DejaVu fonts; the packaging recipe uses
               the original research workspace paths and is retained as provenance.
SHA256SUMS.json: integrity manifest for all included files except itself.

PROVENANCE / SCOPE
Pinned ca-tools commit26270ecbd9dadd43a463cf5637606cb964577e4f matched the
observed main branch. Snapshot rows and record counts overlap between tables.
Source manifests retain original workspace paths; corresponding included files
have the same basenames, usually under lineage/, literature/ or repositories/.
Not every downloaded source is redistributed: journal papers and large original
archives are linked rather than included. Some logs retain unsuccessful retrieval
steps; report.txt and finalized indexes state which gaps were subsequently closed.
No external submission or author/maintainer contact was performed.

ATTRIBUTION
Bai XunDi,2026, original dataset v1.0, DOI10.5281/zenodo.23787055; companion
papers DOI10.5281/zenodo.23787051 and10.5281/zenodo.23787053. The reproduced
records/arrays are unmodified CC BY4.0 data (https://creativecommons.org/licenses/by/4.0/).
Original LICENSE and README are in lineage/. Credit the Shokri–Moura and other
ingredients named in each record. Independent check scripts were written for this
audit, not copied from the deposited search software (which was not public).

ca-tools: Christopher Smolen and credited contributors, MIT; original copyright
notice in provenance/ca_tools_LICENSE. Array-specific credit is retained in CSVs.
Historical Colbourn tables retain their original attribution and source URLs.
External mathematical parameter tables are credited to their named authors:
Arhan Canli/Quantavane, T.N. Sitjar, Bergeron, Dwyer, Grömping/CAs, Dzoba,
Sarkar and others in source_index.json and the original record metadata.
Public metadata and factual mathematical data are retained for verification.

Important interpretation: minima from stated reductions are constructed upper
bounds on the inspected inputs, not lower bounds excluding every optimization.
The verdict is an evidence-based prior-art assessment, not a proof of novelty.
