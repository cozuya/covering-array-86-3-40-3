"""Inspect six previously published ternary strength-3 arrays; no search or repair."""
from pathlib import Path
import collections
import csv
import hashlib
import itertools
import json
import math

BASE = Path(__file__).resolve().parent
records = list(csv.DictReader((BASE / "records.csv").open()))
checks = []
for record in records:
    if record["t"] != "3" or record["v"] != "3":
        continue
    path = BASE / Path(record["file"]).name
    data = path.read_bytes()
    array = [list(map(int, line.split())) for line in data.decode().splitlines()
             if line.strip() and not line.startswith("#")]
    n, k = int(record["N"]), int(record["k"])
    assert len(array) == n
    assert all(len(row) == k and set(row) <= {0, 1, 2} for row in array)
    required = set(itertools.product(range(3), repeat=3))
    missing = 0
    witnesses = [0] * n
    for i, j, h in itertools.combinations(range(k), 3):
        seen = collections.defaultdict(list)
        for ri, row in enumerate(array):
            seen[row[i], row[j], row[h]].append(ri)
        missing += len(required - seen.keys())
        for occupants in seen.values():
            if len(occupants) == 1:
                witnesses[occupants[0]] += 1
    digest = hashlib.sha256(data).hexdigest()
    result = dict(file=path.name, n=n, k=k, missing=missing, sha256=digest,
                  sha_matches_manifest=digest == record["sha256"],
                  requirements=math.comb(k, 3) * 27,
                  min_unique_witnesses_per_row=min(witnesses),
                  redundant_rows_zero_based=[i for i, x in enumerate(witnesses) if not x])
    assert missing == 0 and digest == record["sha256"]
    checks.append(result)
print(json.dumps(checks, indent=2))
(BASE / "independent_prior_checks.json").write_text(json.dumps(checks, indent=2))
