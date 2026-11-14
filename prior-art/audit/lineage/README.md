# Covering arrays: verified improvements to the ca-tools table (data, certificates, verification code, Lean sources)

Version 1.0, 2026-10-30. Author: Bai XunDi (Independent researcher).
Companion papers: A, "Covering arrays from line-polychromatic colourings of affine planes", https://doi.org/10.5281/zenodo.23787051 ;
B, "Two-row covering perfect hash families from Singer cycles and an improved table of covering arrays", https://doi.org/10.5281/zenodo.23787053 .
This data record: https://doi.org/10.5281/zenodo.23787055

## 1. What the records are

A covering array CA(N; t, k, v) is an N x k array over the symbols 0..v-1 such that on every choice of t columns every one of
the v^t t-tuples occurs in some row.  The smallest N is written CAN(t, k, v); every explicit array gives an upper bound.
`records.csv` lists 301 arrays, for 83 pairs (t, v) with t = 2, 3, 4, 5, 6, each with fewer rows than the best value `table_N`
that the ca-tools table (`table/ca_table.csv`, main at commit f0559b50, 2026-10-29) gave on that date for the same t, v and at least k
columns (the table is monotone in k: "stair-step").  The saving is `gain = table_N - N`; the sum over all records is 4,875,193,462 rows.
A row was kept as a record only if it was not dominated by another array of ours (same or more columns and symbols with the same or
fewer rows) and, when it was prepared, no pending third-party claim known on 2026-10-29 was better.

Large arrays are not stored explicitly when the construction is a theorem applied to a short certificate: 232 records have an explicit array
(`EXH`), 69 are certificate-only (`CERT-*`; the explicit array would need from about 200 MB to several terabytes).
Following the author's decision both kinds are published, each labelled by how it was checked (next section).

| strength | records | explicit, exhaustively checked | certificate + theorem | certificate, separate program | certificate, producer check only |
|---|---|---|---|---|---|
| t = 2 | 3 | 3 | 0 | 0 | 0 |
| t = 3 | 45 | 45 | 0 | 0 | 0 |
| t = 4 | 118 | 118 | 0 | 0 | 0 |
| t = 5 | 68 | 46 | 19 | 2 | 1 |
| t = 6 | 67 | 20 | 16 | 28 | 3 |
| all | 301 | 232 | 35 | 30 | 4 |

## 2. How each class was checked (column `evidence` of records.csv)

* `EXH`: explicit array, checked exhaustively by `code/cacheck.py`: for every t-set of columns, every one of the v^t tuples occurs; the program returns the exact
  number of uncovered (t-set, tuple) pairs, and it must be 0.  Method: each t-set is split into a prefix of t-1 columns and a last column; per prefix the rows are
  bucketed by the base-v code of the prefix, and for blocks of 64 last columns the one-hot masks `1 << symbol` are OR-ed per bucket; a t-set is covered iff all
  v^(t-1) ORs equal 2^v - 1.  The checker has its own tests (`code/test_cacheck.py`: 3,744 cases against a brute-force reference in the ledger run (not re-run when this package was assembled), including orthogonal arrays,
  random arrays, arrays with a row deleted, which must fail).  Every record was also checked with a negative control: deleting a row that is not redundant makes the
  check fail.  For some records the check was run by the producer with the same program and is tied to the file by its sha256 (stated in `evidence`).
  The arrays are stored in canonical text: N lines of k space-separated decimal symbols, `\n` line ends; `SHA256SUMS` lists the sha256 of every file.
* `CERT-T` (certificate + theorem): no explicit array.  The certificate (a Sherwood CPHF, or a colouring of AG(2,q) with the parameters of a pencil / poly2 /
  two-column construction) is checked by `code/cert_verify.py` over all t-sets of columns (CPHF) or all q^2 + q lines (colourings) with the size formula and a negative
  control; the covering-array property then follows from a theorem proved in paper A or B (for CPHF: Sherwood-Martirosyan-Colbourn; fusion steps: CKRS 2010 Lemma 3.1).
  The Lean sources formalise the general constructions and some instances (see `lean/SidonLean/README.md`).  What is not done for these records: the explicit array was not built and checked tuple by tuple.
  For the certificates with fused Reed-Solomon parts (file names containing `rsfusebf`; 15 records of paper A) `cert_verify.py` checks the colouring / cover conditions and the row-count
  formula only; the exactness of the fused parts on all subsets, the row-level regeneration on 48 to 64 stratified t-sets and the negative controls are in the producer's logs
  `certificates/verification_logs/verify_*.json` (written by a program independent of the builder).
* `CERT-C` (certificate, separate program): certificate-only records (elliptic two-block arrays and their extension by a pencil column, paper B) whose
  certificate was re-checked by a program other than the one that built them (`code/cert_verify_ell.py`, and the verifiers in `code/independent/`,
  written from the proofs alone; logs in `certificates/verification_logs/`).  Same caveat: no explicit array.
* `CERT-P` (certificate, producer check only): the PHF compositions (Reed-Solomon perfect hash family composed with a pencil array, paper B) carry the producer's
  check only (certificate + proof + sampled check); and one record built from a third-party certificate that could not be re-checked.  Treat these as claims to be
  verified; `code/independent/phf_verify.py` and `compose_check.py` can be run by anyone.

The limits of each record's check are stated in its `evidence` field.

Labels of the companion papers and the codes of `records.csv` (A: Tables 3 and 4 of paper A; B: Table 4 of paper B):

| paper label | meaning in the paper | records | `evidence` code |
|---|---|---|---|
| E (A and B) | explicit array, checked exhaustively by the exhaustive checker, with negative control | 232 (A: 49, B: 183) | `EXH` |
| c (A) | certificate for the theorems of paper A, array not stored; colouring and row count re-checked by `cert_verify.py`, fused parts and sampled t-sets by the producer's log | 15 (A) | `CERT-T` |
| C (B), CPHF | Sherwood CPHF certificate re-checked by a separate program on every t-set of columns | 20 (B) | `CERT-T` |
| C (B), elliptic and pencil-column | certificate re-checked by a separate program (23 elliptic two-block arrays, 7 extensions by a pencil column) | 30 (B) | `CERT-C` |
| P (B) | certificate (PHF composition) checked only by the program that produced it | 3 (B) | `CERT-P` |
| X (B) | CA(218477;5,2801,6): fusion of a third-party certificate, not re-checked | 1 (B) | `CERT-P` |

(the codes `CERT-T` and `CERT-C` are as in this section; the 15 + 20 records of class `c` / `C` (CPHF) are the 35 `CERT-T` records.)

## 3. Verifying (from the package root)

Unzip `arrays_t*.zip`, `certificates.zip` and `code.zip` into one folder together with the loose files (`records.csv`, `SHA256SUMS`, ...); `lean.zip` is optional.
Install the dependencies (`py -3.10 -m pip install -r requirements.txt`; numpy and numba; the first call compiles the numba kernels).

    sha256sum -c SHA256SUMS                                   # or: py -3.10 code/verify_package.py --sha
    py -3.10 code/verify_package.py --arrays --sample 10      # cacheck.py on 10 random arrays
    py -3.10 code/verify_package.py --arrays --cells "CA(1089;3,11,9)" --negctl
    py -3.10 code/verify_package.py --arrays --all --max-bytes 100000000    # all arrays up to 100 MB
    py -3.10 code/cacheck.py arrays/CA_1089_3_11_9.txt 3      # one array directly (t = 3)
    py -3.10 code/verify_package.py --certs                   # re-run cert_verify.py on every certificate file

`code/verify_package.py --arrays` accepts an array when cacheck reports 0 uncovered pairs, the shape equals (N, k) and the largest symbol is below v.
The big arrays (up to about 1 GB, t = 4, 5, 6) need minutes to hours and a few GB of memory; the sample and the small arrays are quick.  `CERTIFICATES.md` explains the
certificate formats and how to expand a CPHF certificate into its array (`code/build_cphf_ca.py`) and check it.

## 4. Files

| file | size (bytes) | content |
|---|---|---|
| README.md | - | this file |
| CERTIFICATES.md | 10491 | formats of the certificate files and how to expand / check them (also inside certificates.zip) |
| LICENSE | 2057 | licences: CC BY 4.0 (data, text), MIT (code) |
| SHA256SUMS | 21808 | sha256 of every array in arrays_t*.zip (run `sha256sum -c SHA256SUMS` from the package root after unzipping) |
| arrays_t2.zip | 8208 | explicit arrays of strength t=2 (CA_<N>_<t>_<k>_<v>.txt under arrays/) |
| arrays_t3.zip | 25803070 | explicit arrays of strength t=3 (CA_<N>_<t>_<k>_<v>.txt under arrays/) |
| arrays_t4.zip | 1046527372 | explicit arrays of strength t=4 (CA_<N>_<t>_<k>_<v>.txt under arrays/) |
| arrays_t5.zip | 644841714 | explicit arrays of strength t=5 (CA_<N>_<t>_<k>_<v>.txt under arrays/) |
| arrays_t5b.zip | 909015946 | four further explicit arrays of strength t=5 (CA(12687420;5,27,20), CA(14249976;5,27,24), CA(9088709;5,25,21), CA(9368568;5,25,22); same layout) |
| arrays_t6.zip | 364497862 | explicit arrays of strength t=6 (CA_<N>_<t>_<k>_<v>.txt under arrays/) |
| certificates.zip | 282222085 | certificates of the certificate-only records, proofs, verification logs, CERTIFICATES.md |
| certificates_map.csv | 13186 | for every certificate-only record: certificate files, sha256, proof, verification logs |
| code.zip | 42591 | verification programs (cacheck.py, cert_verify*.py, independent verifiers, CPHF expander, driver), MIT |
| lean.zip | 1644389 | Lean 4 project SidonLean without build outputs (sources, instances, logs), MIT |
| package_check_log.txt | 3197 | checks run on a fresh unzip of the package files that changed in the last revision |
| records.csv | 196194 | the records (one row per record) |
| requirements.txt | 191 | Python dependencies of the code |
| zenodo_metadata.json | 3111 | metadata for the Zenodo upload (InvenioRDM style) |

After unzipping: `arrays/CA_<N>_<t>_<k>_<v>.txt`, `certificates/` (with `proofs/` and `verification_logs/`), `code/` (with `independent/`), `lean/SidonLean/`.

`records.csv` columns: `t, v, k, N` (CA(N; t, k, v)); `table_N` (best value in the ca-tools table on 2026-10-29 for t, v and at least k columns); `gain` (= table_N - N);
`class` (how the array is obtained: own construction, derived by fusion, post-optimised, published-missing reconstruction, derived by PHF composition);
`credit` (who contributed what, see below); `construction` (details); `evidence` (code and check method, section 2); `file` (path of the array inside the unzipped package,
or, for certificate-only records, the `;`-separated certificate files); `sha256` (hash of the array, or `;`-separated hashes of the certificate files in the same order).

## 5. Credit policy

For a record derived from the work of other authors (a fusion, a post-optimisation, a reconstruction from a published construction, an extension of a published array) the credit
column names the other authors and their ingredient first and the derivation by Bai XunDi after it (the same wording as in the submission files prepared for the ca-tools table).
Records constructed from our own theorems are credited to Bai XunDi.  Classical ingredients (Reed-Solomon / Bush orthogonal arrays, Sherwood-Martirosyan-Colbourn CPHFs, the
CKRS fusion lemma, hyperoval arrays) are cited in `construction`.  If you find a credit to be incomplete please tell the author.

## 6. Corrections applied to the ledger, and what is left out

* The record list is the author's ledger of 2026-10-29 (305 rows) after: removal of 8 rows that a freshness check against third-party repositories found to be beaten
  (CA(23068332;5,1024,14) [third party: 14680051 rows]; CA(23068334;5,1024,15) [third party: 14680051 rows]; CA(23068336;5,1024,16) [third party: 14680051 rows]; CA(31236657;5,1024,17) [third party: 19877985 rows]; CA(54473907;5,1369,18) [third party: 47045539 rows]; CA(54473959;5,1369,19) [third party: 47045539 rows]; CA(533198049;6,361,15) [third party: 234880816 rows]; CA(578633473;6,361,17) [third party: 337925745 rows]);
  the label corrections of the referee passes of papers A and B (`class` / `construction` texts that wrongly named a post-processing step, fusion counts, parent labels, evidence class
  `P` to `C` for 30 elliptic records); replacement of 7 records by smaller exhaustively checked arrays from a later search pass (CA(3102;3,15,12), CA(5610;3,19,14), CA(6384;3,19,16), CA(9516;3,21,17), CA(9891;3,21,18), CA(3580398;5,21,18), CA(8808908;5,25,20)), and addition of
  11 new exhaustively checked arrays of strengths 2 and 3 (and strength 5) from the same search.  CA(3710719;5,21,19) is now an explicit exhaustively checked array.
  After that, 13 records of the poly2 family (paper A) were replaced by smaller ones of the last search stage (CKRS fusion of the Reed-Solomon parts on the old columns, paper A Section 8):
  CA(12687500;5,27,20) to CA(12687420;5,27,20); CA(14250000;5,27,24) to CA(14249976;5,27,24); CA(9088749;5,25,21) to CA(9088709;5,25,21); CA(9368590;5,25,22) to CA(9368568;5,25,22); CA(6854640;6,15,12) to CA(6854628;6,15,12); CA(23068672;6,18,14) to CA(23068644;6,18,14); CA(24117248;6,18,15) to CA(24117232;6,18,15); CA(31719424;6,19,14) to CA(31587750;6,19,14); CA(68027562;6,21,18) to CA(68027544;6,21,18); CA(202604884;6,25,20) to CA(202604830;6,25,20); CA(209041227;6,25,21) to CA(209041187;6,25,21); CA(215477570;6,25,22) to CA(215477548;6,25,22); CA(356250000;6,27,24) to CA(356249976;6,27,24).
  The four t = 5 records are now explicit arrays (`EXH`, `arrays_t5b.zip`); the nine t = 6 records are certificates (`CERT-T`, the files `cert_*rsfusebf*`); the certificates of the replaced values were removed,
  except `cert_202604884_6_25_20_*`, `cert_209041227_6_25_21_*` and `cert_215477570_6_25_22_*`, which stay because the PHF compositions CA(3241678129;6,625,20), CA(3344659617;6,625,21) and
  CA(3447641105;6,625,22) (paper B, Table 4) were computed from these earlier, larger parents (they are the `certificate_files` of those records in `certificates_map.csv`).
  `lean.zip` still contains the Lean instances for some of the earlier, larger values (for example CA(12687500;5,27,20)); they remain true statements but are no longer records.
* Left out: records of the ledger that are only candidates (held, unverified, tied or beaten by a pending claim); further arrays of the same search that are in neither paper;
  658 arrays that beat the table but
  are dominated by another of ours; unfinished simulated-annealing states; the construction (search) code, which is not needed to verify anything.
* Values of `table_N` refer to the table of 2026-10-29; the table has probably moved since.

## 7. AI statement

The author conceived and directed this project. Searches, computations, proofs, the literature search and the drafting were carried out with Claude (Anthropic); referee passes and verification programs were produced in separate Claude sessions, independently of the construction code. The author takes full responsibility for the content.

## 8. Citation

Bai, XunDi (2026). Covering arrays: verified improvements to the ca-tools table (data, certificates, verification code, Lean sources) (Version 1.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.23787055

Please also cite the companion papers: Bai, XunDi (2026), A: https://doi.org/10.5281/zenodo.23787051 ; B: https://doi.org/10.5281/zenodo.23787053 .  Cite the original authors whose ingredients are named in `credit`.

## 9. Licence

Data and text: CC BY 4.0.  Code (`code.zip`, `lean.zip`): MIT.  See `LICENSE`.
