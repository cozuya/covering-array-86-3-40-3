# Literature search log

Date/cutoff:2026-11-14. This is a consolidated route log. Early queries are grouped by purpose; it is not represented as a verbatim export of all web-tool calls. Exact late queries and API URLs are recorded below. Findings and access qualifications are in `findings.md`.

## Search routes and outcomes

| Route | Method | Principal outcome |
|---|---|---|
| Exact target notation and near bounds | Both web engines; strength3/ternary/40/86,87,88,89 variants |2012 Table2(a)89; no86/40 hit |
| NIST covering-array catalogue | Direct tables3.3 and3.4; ACTS library references |118 at ternaryk40; old generator output, not current record |
| Colbourn / ASU | Original links, CAs documentation and preserved data2intelligence tables |Nov2024 frozen89; CK construction label must not be used as2002 numeric date |
| Torres-Jimenez |2012 full paper; NIST link; old institutional site |2012 exact89; old witness repository unavailable |
| Survey / construction references | Grömping2026 report, CKRS2010, Roux2006, source reference chasing |Exact fusion/derivation formulas; noncompetitive indirect consequences |
| OA / coding families | Rao bound; primary CA3 preprint; classification/arXiv papers |OA237 minimum; stronger86-row source impossible |
| Mixed-level constructions | Strength>=3 mixed papers, column expansion, cyclotomy chapter, MCA documentation |No applicable40-column example; named paywall/download gaps |
| Theses | SFU Pender2026 full thesis; citation routing |CA motivation only; no target claim |
| Recent preprints | OpenAlex and Crossref direct API; indexed arXiv and Zenodo |Recent Zenodo leads sent to repository/lineage agents |
| Alternative representation | Covering schemes, difference schemes, invariant codes |2026 full theorem not target;2024 public tables k<=9 |
| AI-assisted record announcements | IRSI and Numaro primary pages |No displayed target; bounded artifact gaps |

## Direct API queries

- https://api.openalex.org/works?search=covering%20arrays&filter=from_publication_date:2024-01-01,to_publication_date:2026-11-14&per-page=100
  - Success,100relevance records; raw and compact files saved. This query returns a large broad result universe and was not paginated exhaustively.
- https://api.crossref.org/works?query.title=covering%20arrays&filter=from-pub-date:2024-01-01,until-pub-date:2026-11-14&rows=100
  - Success,100relevance records; raw and compact files saved.
- Semantic Scholar search API: HTTP429; no comprehensive direct search achieved.
- https://api.github.com/repos/aadwyer/CA_Database/git/trees/main?recursive=1
  - Success; storedtree scanned for parameterized filenames.
- https://raw.githubusercontent.com/ugroempi/CAs/main/ColbournTables.md
  - Success; frozen/current table documentation obtained.

## Exact recent engine1 queries

All returned no target unless noted; negative results are indexed-search evidence only.

1. `"Two-block covering arrays from elliptic curves"` — found Bai2026 lead, routed to lineage agent.
2. `"Recursive constructions for covering schemes of strength 3"` — officialAIMS public tables.
3. `"A classification of invariant sets" "covering schemes"` — Springer2026 full text.
4. `"Recursive constructions for covering schemes" pdf` — no usable author PDF; official tables accessible.
5. `"CSN(3" "40" "3"` — no target.
6. `"covering schemes" "40" "3" "28"` — no target.
7. `"covering schemes" "Corollary 4.3"` — officialAIMS table references.
8. `"Recursive constructions for covering schemes of strength 3" filetype:pdf` — no usablePDF.
9. `"covering schemes of strength" "ternary"` —2023 predecessor and references.
10. `"covering schemes" "CS(28"` — no target.
11. `"covering array" "86" "40" "3"` — unrelated table/record results.
12. `"CAN(3,40,3)"` — no exact competing claim.
13. `"CA(86;3,40,3)"` — no exact competing claim.
14. `"CA(86,3,40,3)"` — no exact competing claim.
15. `"mixed covering arrays" "40" "86"` — no target.
16. `"mixed-level covering" "40" "strength 3"` — no target.
17. `"Constructions of Mixed Covering Arrays with Strength" pdf` — Shi–Tao2018 public abstract/references.
18. `"Mixed-Level Covering, Locating, and Detecting Arrays via Cyclotomy"` —2024proceedings metadata/publisher paywall.

## Direct platform access distinctions

- Direct Google Scholar URL https://scholar.google.com/scholar?q=%22covering+arrays%22+%22ternary%22+%2286%22 returned tool access failure (`turn76view0`). Indexed-web searches were possible. Do not claim direct Scholar coverage.
- Direct arXiv search https://arxiv.org/search/?query=covering+arrays+ternary&searchtype=all&abstracts=show&order=-announced_date_first&size=50 returnedDisabledError (`turn76view1`). Individualpapers2510.17596,2603.13963,1901.03594 were obtained through known links.
- AIMS2024 full HTML click initially showed subscription/login restriction (`turn72view0`), and OpenAlex's exportPDF returned0bytes. **Subsequently CLOSED by lineage:** author-uploaded public full text on ResearchGate was retrieved and the recursive theorems inspected; do not retain the initial access failure as a combined-audit gap.
- Springer2026 covering-schemes full HTML and1.78MBPDF succeeded; Springer2023 schemes,2018extended-permutation-vector family,2024mixedcyclotomy full papers were not obtained.
- Shi–Tao2018 directHTTP returned a human-captcha form; no bypass attempted. Indexed official abstract and references remained accessible.
- ZenodoAPI direct request for24055371 returned403. Parent's lineage agent obtained its primary full text by another legitimate route; this agent did not use an abstract to assert a full-table negative.

## Final source-index verification

Targeted follow-ups (not a new broad search) verified primary metadata and corrected secondary transcription:

- Wiley exact89 paper first published26August2012 (`turn111view0`).
- Nurmela2004 indexed publisher full text: Table1 ternarystrength2,k20,N15 and explicit single-cell tabu neighborhood (`turn105search1`).
- Nayeri–Colbourn–Konjevod author full IWOCA2009 PDF retrieved (`turn108view0`), and conference DOI verified (`turn110search0`, `turn111view1`). The method predates its2013journalversion.
- Repository agent obtained primaryCCL2008 Theorem3: two strength3ingredients are required. The strength2B printed in Grömping2026§7.8.3 is a transcription error; it cannot justify86at40.
- Root's fullPLOS2017 XML and three supplement audits were read locally; no reported target86result. All three source datasets were available, so no access gap remains there.

## Reproducible parameter checks

`python research/literature/scan_indirect.py` reads the parent's downloaded `research/root/ca_frame_main.csv` and writes the finite generic fusion/derivation scan. It constructs no new array and searches no array space. Formula source and precise scope are in `findings.md`.
