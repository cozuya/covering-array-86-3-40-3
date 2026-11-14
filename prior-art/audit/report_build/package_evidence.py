#!/usr/bin/env python3
"""Package already-inspected public evidence and reproducible finite audits."""
from pathlib import Path
import json, shutil, hashlib, zipfile

ROOT = Path(__file__).resolve().parents[1]
DEST = ROOT/'output/ca86_novelty'
DEST.mkdir(parents=True,exist_ok=True)

def cp(src,dst):
    a=ROOT/src; b=DEST/dst
    if not a.is_file(): raise FileNotFoundError(a)
    b.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(a,b)

root_queries=[
 ('Exact target / source discovery',['"CAN(3,40,3)"','"covering array" "86" "40"','"ca-tools" covering array Smolen'],'Located maintained table and lineage; no competing target disclosure.'),
 ('Repository and formatting variants',['site:github.com/chrispbsmolen/ca-tools "3,3,40" "87"','site:github.com/chrispbsmolen/ca-tools "86" "40" "table"','"covering" "CA(86" "40"','"covering array" "3, 40, 3"'],'Direct table/API retrieval followed because indexed raw CSV coverage was weak.'),
 ('Recent bound / Bai lineage',['"covering arrays" "86" "40" "2026"','"CAN(3,40,3)" "87"','"ca-tools" "Bai"'],'Original fixed Zenodo sources and current GitHub submissions inspected.'),
 ('Larger-alphabet / lower-bound routing',['"covering arrays" "4" "21" "lower bound" strength two','"CAN(2,39,4)"','"covering array" "Rao" lower bounds'],'Used to test stronger-source routes; primary CKRS formulas and elementary OA reasoning retained.'),
 ('Filename and terminology variants',['"CA_86_3_40_3"','"CAN(3,40,3)" -site:roadrescuenetwork.com','"covering array" "86-run"','"ternary" "covering" "40" "87"'],'No concrete equal-or-stronger construction identified.'),
 ('Exact notation and recent ternary bounds',['"covering arrays" "86" "40" -site:academia.edu -site:researchgate.net','"CA(86;3,40,3)" OR "CA(86; 3, 40, 3)" OR "CA(86,3,40,3)"','"covering array" "40 factors" "3" tests','"covering arrays" "40" "ternary" 2025 2026'],'Followed primary papers/datasets; numeric 86 hits often referred to other strengths or small widths.'),
 ('Academic/deposit domain search',['"covering array" "86" site:scholar.google.com','"covering arrays" "40" "86" site:arxiv.org','"covering arrays" "86" site:zenodo.org'],'Indexed search only for inaccessible direct platforms; individual public papers and deposits retrieved.'),
 ('Multilingual / informal / deposit',['"arreglos de cobertura" "40" "86"','"覆盖阵列" "86" "40"','"covering arrays" "86" site:mathoverflow.net','"covering array" "40" site:zenodo.org'],'No concrete rival target disclosed in inspected results.'),
 ('Stronger row counts and older techniques',['"Methods to Construct Uniform Covering Arrays" "40"','"covering array" "85" "40" "3"','"covering array" "81" "40" "3"','"covering array" "87" "40" "3"'],'Avoided limiting search to86; older heuristic and supplemental routes checked.'),
 ('Primary product-theorem correction',['site:cse.unl.edu/~myra/papers/auga.pdf "Theorem 3"','site:cse.unl.edu/~myra/papers/auga.pdf "CAN" "DCAN"'],'Indexed full theorem shows both CA ingredients strength3, resolving misleading secondary formula.'),
]
log={'cutoff':'2026-11-14','type':'Consolidated root search log; query grouping reconstructed from executed searches, not exhaustive event telemetry','groups':[{'date':'2026-11-14','purpose':a,'queries':b,'finding':c} for a,b,c in root_queries],
 'direct_retrieval_groups':[
  {'source':'ca-tools','urls':['https://api.github.com/repos/chrispbsmolen/ca-tools/branches/main','https://api.github.com/repos/chrispbsmolen/ca-tools/commits/26270ecbd9dadd43a463cf5637606cb964577e4f','https://raw.githubusercontent.com/chrispbsmolen/ca-tools/26270ecbd9dadd43a463cf5637606cb964577e4f/table/ca_frame.csv','https://raw.githubusercontent.com/chrispbsmolen/ca-tools/26270ecbd9dadd43a463cf5637606cb964577e4f/table/ca_table.csv'],'result':'Pinned/current frame comparison, all direct/stronger entries, full provenance, derived table, issue/PR history.'},
  {'source':'Bai Zenodo','urls':['https://zenodo.org/api/records/23787055','https://zenodo.org/api/records/23787055/files/arrays_t3.zip','https://zenodo.org/api/records/23787055/files/records.csv','https://zenodo.org/api/records/23787055/versions'],'result':'Actual file timestamps/versions and downloaded checksums verified. Six neighboring arrays independently checked.'},
  {'source':'OpenAlex','urls':['https://api.openalex.org/works?search=ternary%20covering%20arrays&per-page=50','https://api.openalex.org/works/https://doi.org/10.1002/jcd.21963'],'result':'50 ternary results plus original Shokri record and5 indexed direct citers. Separate literature branch adds100 recent results.'},
  {'source':'Crossref','urls':['https://api.crossref.org/works?query.bibliographic=ternary%20covering%20arrays&rows=50'],'result':'50 ternary results. Separate literature branch adds100 recent covering-array results.'},
  {'source':'PLOS2017','urls':['https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0189283'],'result':'Full article XML and all3 supplement archives inspected;562 array headers checked.'},
  {'source':'Primary theorem retrieval','urls':['https://onlinelibrary.wiley.com/doi/10.1002/jcd.21963','https://old.sztaki.hu/~keri/arrays/Colbourn_Keri_Rivas-Soriano_Schlage-Puchta.pdf','https://www.researchgate.net/publication/378413470_Recursive_constructions_for_covering_schemes_of_strength_3','https://cse.unl.edu/~myra/papers/auga.pdf'],'result':'Full relevant theorem text inspected, with author public copy/indexed primary full text where a direct fetch failed.'}
 ],
 'limits':['Not a complete export of every scholarly or repository platform.','Exact-target absence was not used as the sole basis for novelty.','Final material coverage gaps and invalid implications are in report.txt and final source indexes.']}
(DEST/'search_log_root.json').write_text(json.dumps(log,ensure_ascii=False,indent=2)+'\n')

cp(Path('upload')/'Pasted text(3).txt','claim_brief.txt')
for name in ['verify_prior_arrays.py','check_published_scheme_closure.py','published_scheme_closure.json','scheme_convention_audit.json','independent_prior_checks.json','prior87_row_essentiality.json','records.csv','CA_69_3_26_3.txt','CA_72_3_27_3.txt','CA_86_3_39_3.txt','CA_87_3_40_3.txt','CA_88_3_41_3.txt','CA_90_3_42_3.txt','zenodo23787055_arrays_metadata.json','zenodo23787055_records_metadata.json','zenodo23787055_versions.json','zenodo23787055_files.json','zenodo23787055.txt','zenodo23787051.json','zenodo23787053.json','zenodo24054350.json','zenodo24055371.json','dataset_dominance_scan.json','recursive_schemes_web_evidence.json','search_log.json','source_manifest.json','README.md','LICENSE','SHA256SUMS']:
    cp(f'research/lineage/{name}',f'lineage/{name}')
for name in ['final_source_index.json','indirect_catalogue_scan.json','search_log.md','openalex_screened100.json','crossref_screened100.json','ColbournTables.md','t3v3.html']:
    cp(f'research/literature/{name}',f'literature/{name}')
for name in ['red_team_final.json','search_log.json','download_manifest.json','repo_search_covering_array.json','repo_search_covering_arrays.json','repo_search_ternary_covering.json','zenodo_23839216.json','zenodo_23848283.json','zenodo_23877721.json','CA_Database_tree.json','CA_Database_commits.json','CAs_tree.json','CAs_commits.json','CAs_releases.json']:
    cp(f'research/repositories/{name}',f'repositories/{name}')
for repo in ['arhancanli__quantavane-covering-arrays','tns-research__covering-array-records','MichelBacon__covering-arrays-rms-extension','dzoba__covering-arrays-2026','ksarkar__CoveringArray']:
    for name in ['tree.json','commits.json','issues.json','releases.json']:
        src=Path('research/repositories')/repo/name
        if (ROOT/src).is_file():cp(src,Path('repositories')/repo/name)
for name in ['families.csv','cells.csv','ca-tools/rows.csv']:
    cp(f'research/repositories/arhancanli__quantavane-covering-arrays/{name}',f'repositories/arhancanli__quantavane-covering-arrays/{name}')
for p in (ROOT/'research/repositories/ksarkar__CoveringArray/data').rglob('*.txt'):
    cp(p.relative_to(ROOT),Path('repositories/ksarkar__CoveringArray')/p.relative_to(ROOT/'research/repositories/ksarkar__CoveringArray'))
for name in ['commit_pin.json','main_branch.json','array87_commits.json','repo.json','issues_all.json','pulls_all.json','releases.json','comments_3.json','comments_34.json','comments_47.json','comments_62.json','comments_76.json','comments_77.json','comments_78.json','comments_79.json','submission34_claims.csv','CONTRIBUTING.md','ca_tools_LICENSE','plos2017_dataset_scan.json','scholarly_discovery_summary.json','openalex_shokri.json','openalex_shokri_citers.json']:
    cp(f'research/root/{name}',f'provenance/{name}')
cp('output/build_report.py','report_build/build_report.py')
cp('output/package_evidence.py','report_build/package_evidence.py')

readme='''CA86 CA(86;3,40,3) — PRIOR-ART AUDIT
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
'''
(DEST/'README.txt').write_text(readme)
manifest=[]
for p in sorted(DEST.rglob('*')):
    if p.is_file() and p.name!='SHA256SUMS.json':
        manifest.append({'path':str(p.relative_to(DEST)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
(DEST/'SHA256SUMS.json').write_text(json.dumps(manifest,indent=2)+'\n')
archive=ROOT/'output/CA86_Audit_Evidence.zip'
with zipfile.ZipFile(archive,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=7) as z:
    for p in sorted(DEST.rglob('*')):
        if p.is_file():z.write(p,Path('ca86_novelty')/p.relative_to(DEST))
print(json.dumps({'archive':str(archive),'bytes':archive.stat().st_size,'files':len(manifest)+1,'sha256':hashlib.sha256(archive.read_bytes()).hexdigest()},indent=2))
