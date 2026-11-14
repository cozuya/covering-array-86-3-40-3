# Supplied prior-art report and complete audit evidence

These copies of the user-supplied artifacts use the project's `CA86` naming:

- [CA86_Prior_Art_Report.pdf](CA86_Prior_Art_Report.pdf):
  the report rebuilt from the supplied source with updated project labels.
- [CA86_Audit_Evidence.zip](CA86_Audit_Evidence.zip):
  the complete evidence bundle with matching project labels and regenerated hashes.

[REPORT.txt](REPORT.txt) is a byte-identical display copy of the bundle's complete
plain-text report. [audit/](audit) contains every member of the adapted ZIP, with
the common `ca86_novelty/` prefix removed. The package checker compares every
extracted byte against the ZIP and verifies the included hash manifest.

Start with the [audit README](audit/README.txt),
[report](REPORT.txt), and [39-source index](audit/source_index.json).
The bundle includes fixed CSV inputs, source metadata, query logs, repository and
publication snapshots, finite-check scripts, six prior arrays, and recorded results.
It retains original licenses and attribution.

The verdict **LIKELY NOVEL** has a research cutoff of **November 14, 2026**.
The audit received a claim brief but did not receive the candidate matrix or search
code. Its independent array checks concern the published predecessors; candidate
verification is supplied separately by this repository's Lean proof and cross-check.
See [../PRIOR_ART.md](../PRIOR_ART.md) for the concise assessment and limitations.

The project labels, filenames, and report text were adapted at Chris's request.
Numerical findings, source attribution, third-party data, and licenses are unchanged.
Some historical logs and report-building scripts reference research workspace paths.
The finite checks run from a scratch copy using the commands in
[../REPRODUCE.md](../REPRODUCE.md). Rebuilding the formatted PDF is optional and
requires reportlab and the fonts named in the report-building script. Run
`python3 prior-art/audit/report_build/build_report.py` to rebuild the PDF and report text.
