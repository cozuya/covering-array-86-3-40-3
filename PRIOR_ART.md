# Prior art and the numerical improvement

The supplied November 14, 2026 investigation concludes **LIKELY NOVEL**: no earlier
public result establishing `CAN(3,40,3) ≤ 86` was found in the sources examined.
The strongest verified exact-target predecessor has **87 rows**. This supports
describing the construction as an improvement of the best previously located public
upper bound from 87 to 86, subject to the documented limits of that investigation.

The full [PDF](prior-art/CA86_Prior_Art_Report.pdf),
[plain-text report](prior-art/REPORT.txt), [39-source index](prior-art/audit/source_index.json),
and [complete evidence bundle](prior-art/README.md) are preserved. This page summarizes
that supplied review; packaging the repository did not repeat its entire literature
search. The review did not receive the candidate matrix or search implementation.
The matrix's correctness is now established separately by the Lean proof.

## Exact-target history and nearest conflicts

| Source | Evidenced date | Result | Relationship to this construction |
| --- | --- | --- | --- |
| Avila-George, Torres-Jimenez, Hernández, [2012 paper](https://doi.org/10.1155/2012/897027), Table 2(a) | August 26, 2012 | 89 rows at strength 3, width 40, alphabet 3 | Earlier directly inspected numerical bound; paper compares against 90 |
| Preserved [Colbourn table](https://www.data2intelligence.de/ColbournTables/t3v3.html) | November 2024 snapshot | 89 rows | Historical comparison table |
| Shokri–Moura, [New Families of Strength-3 Covering Arrays Using Linear Feedback Shift Register Sequences](https://doi.org/10.1002/jcd.21963) | First online February 14, 2025; family announced in 2023 | 87 rows, 39 columns at q=3 | Underlying construction has one fewer column than the target |
| Bai XunDi, [original dataset v1.0](https://doi.org/10.5281/zenodo.23787055) | October 30, 2026 | 86×39 and 87×40 ternary strength-three arrays | Exact-target predecessor is 87; same-row predecessor lacks a column |
| [ca-tools Bai submission](https://github.com/chrispbsmolen/ca-tools/pull/34) | November 2, 2026 | Ingestion of 87×40 | Maintained-table ingestion, after the original deposit |
| [Pinned ca-tools snapshot](https://github.com/chrispbsmolen/ca-tools/tree/26270ecbd9dadd43a463cf5637606cb964577e4f) | November 13–14, 2026 | 87 rows for the target | Snapshot identified by commit `26270ecbd9dadd43a463cf5637606cb964577e4f` |
| CA86 | November 14, 2026, as supplied by Chris Ozols | 86×40 | Explicit witness and formal upper bound in this repository |

The older table's construction label does not by itself establish an earlier exact
disclosure date. These dates are the evidence located by the supplied audit, rather
than an exhaustive reconstruction of all historical improvements.

## Shokri–Moura and Bai lineage

Shokri–Moura's q-plication family has

```math
N=5q^3-6q^2+2q, \qquad k=q(q^2+q+1).
```

At `q=3` it gives **87×39**, rather than 87×40 or 86×40. Bai's deposited 40th column
is a computationally repaired extension. The original dataset includes six nearby
ternary strength-three arrays: 69×26, 72×27, 86×39, 87×40, 88×41, and 90×42.
The supplied audit independently verifies all six against their deposited hashes.

The unchanged [87×40 parent](original/CA_87_3_40_3.txt) has SHA-256
`677f089f0d797eec1fcbe9b6ffabe81f665b1405a83b06ee151ca59913504158`.
Every parent row uniquely witnesses at least 25 interactions, so merely deleting
one row fails. The new matrix was obtained by postoptimization of that parent;
the detailed search code and seeds were not included in the supplied Lean handoff.

The neighboring **86×39** array has SHA-256
`bf5b1110505449dd2e9e00c08f03558d381effc09f2c9e921ff40f4ca82d0f20`.
It is a close predecessor, but adding a fully covered column is a substantive
construction problem. Row and column permutations or symbol relabelings cannot
change its width.

## Indirect constructions examined in the supplied audit

The review goes beyond exact filename and table lookups. Its fixed-input scripts
scan larger alphabets and higher strengths, checking every order of ordinary
fusion and derivation while retaining sufficient width, strength, and symbols.

| Fixed input | Entries | Eligible entries | Best obtained row count |
| --- | --- | --- | --- |
| `ca_frame.csv` | 9,627 | 4,689 | 87 |
| `ca_table.csv` | 15,572 | 9,329 | 87 |
| Preserved Colbourn catalogue | 13,641 | 8,752 | 89 |
| `derived.csv` | 1,082 | 830 | 348 |
| Bai's `records.csv` | 301 | 82 | 87 |

The input tables overlap. These are upper bounds obtained from inspected sources
and specified transformations; they are not lower bounds excluding other repairs
or optimizations. The [recorded finite audit](prior-art/audit/audit_results.json)
preserves source rows and reduction paths.

Other consequential leads included recursive covering schemes, independent recent
repositories, larger-alphabet families, higher-strength sources, mixed-level and
orthogonal arrays, and the actual PLOS shortening supplements. The report resolves
an apparent 86-row product formula by checking the primary theorem: both base
arrays need strength three, so the proposed 14-row ingredient is inadmissible.
For the inspected ternary scheme recurrences and seeds, an optimistic closure
reaches at most 18 columns within 28 scheme rows, insufficient for the target.

## Scope of the novelty claim

- **Numerical bound:** the audit found no earlier qualifying public result; its
  verdict is likely novel as of the November 14, 2026 cutoff.
- **Explicit witness:** no prior array with at most 86 rows and at least 40 ternary
  columns was located. The audit did not perform an isomorphism comparison of
  the candidate, which it did not receive.
- **Search method:** row deletion, tabu search, and postoptimization are established.
  See [Nurmela (2004)](https://doi.org/10.1016/S0166-218X(03)00291-9),
  [Nayeri–Colbourn–Konjevod (2009)](https://doi.org/10.1007/978-3-642-10217-2_40),
  and [Bai's original companion paper](https://doi.org/10.5281/zenodo.23787053).
  The supplied materials do not establish novelty of a specific block-swap technique.

The report documents incomplete access to the obsolete Torres-Jimenez repository,
the complete 2018 extended-permutation-vector computational results, some mixed-array
full texts, a 2023 covering-scheme predecessor, and Numaro's undisplayed full list.
Some scholarly APIs and indexed informal-source searches were also limited. No
concrete unresolved qualifying claim was found, but those limits prevent treating
the search as proof of worldwide priority.

No external submission or author/maintainer contact is part of this package.
Formal verification proves the upper bound; it does not prove optimality,
novelty, discovery dates, or completeness of a literature search.
