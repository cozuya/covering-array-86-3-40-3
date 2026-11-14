#!/usr/bin/env python3
"""Independently enumerate all interactions in the text matrix, without Lean witnesses."""
from collections import Counter
import hashlib
from itertools import combinations
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parent.parent
DIGEST = '7dc7ab1e231dce3cde5cc1c6b35c4911f34145fd4dfe5d80f8ea26b235b27f8a'


def require(condition, message):
    if not condition:
        raise SystemExit('FAIL: ' + message)


def coverage(rows):
    missing = 0
    unique_by_row = [0] * len(rows)
    multiplicities = Counter()
    for i, j, k in combinations(range(40), 3):
        counts = [0] * 27
        last = [0] * 27
        for r, row in enumerate(rows):
            code = 9 * row[i] + 3 * row[j] + row[k]
            counts[code] += 1
            last[code] = r
        missing += counts.count(0)
        multiplicities.update(counts)
        for code, count in enumerate(counts):
            if count == 1:
                unique_by_row[last[code]] += 1
    return missing, unique_by_row, dict(sorted(multiplicities.items()))


def main():
    require(len(sys.argv) <= 2, 'Usage: check.py [OUTPUT_JSON]')
    raw = (ROOT / 'CA_86_3_40_3.txt').read_bytes()
    require(hashlib.sha256(raw).hexdigest() == DIGEST, 'Certificate SHA-256 mismatch')
    rows = [list(map(int, line.split())) for line in raw.decode().splitlines()]
    require(len(rows) == 86 and all(len(r) == 40 and set(r) <= {0, 1, 2} for r in rows),
            'Invalid matrix dimensions or alphabet')
    missing, unique, histogram = coverage(rows)
    require(missing == 0, f'{missing} missing requirements')
    bad_missing, _, _ = coverage([[0] * 40 for _ in range(86)])
    require(bad_missing == 9880 * 26, 'All-zero negative control unexpectedly passed')
    report = {
        'status': 'PASS', 'certificate_sha256': DIGEST,
        'rows': 86, 'columns': 40, 'symbols': 3, 'strength': 3,
        'column_triples': 9880, 'requirements': 266760, 'missing_requirements': missing,
        'witness_multiplicity_histogram': histogram, 'unique_witnesses_by_row': unique,
        'redundant_rows_zero_based': [r for r, n in enumerate(unique) if n == 0],
        'negative_control_missing_requirements': bad_missing,
    }
    if len(sys.argv) == 2:
        Path(sys.argv[1]).write_text(json.dumps(report, indent=2) + '\n')
    print(f'CROSSCHECK=PASS: {len(rows)} rows; 9,880 triples; 266,760 requirements; 0 missing')
    print(f'NEGATIVE_CONTROL=PASS: all-zero array misses {bad_missing:,} requirements')


if __name__ == '__main__':
    main()
