# Independent exhaustive matrix check

```sh
bash crosscheck/run.sh
```

This Python standard-library program reads the canonical
[86×40 text matrix](../CA_86_3_40_3.txt), authenticates its SHA-256, and checks its
dimensions and alphabet. It enumerates all 9,880 increasing column triples, counts
the occurrences of each of the 27 symbol assignments, and requires zero missing
interactions. It also records the multiplicity histogram and the requirements
uniquely witnessed by each row.

The implementation does not import the Lean generator, decode its packed numeral,
or reuse its row witnesses. Its negative control checks an all-zero 86×40 matrix
and requires exactly `9,880 × 26 = 256,880` missing interactions.

The output report is `.build/crosscheck.json`; the reviewed run is preserved in
[../evidence/crosscheck.json](../evidence/crosscheck.json) and
[../evidence/crosscheck.log](../evidence/crosscheck.log).
This supplies an independent computational check of the explicit witness. The
mathematical proof is in [the Lean project](../CA86.lean).
