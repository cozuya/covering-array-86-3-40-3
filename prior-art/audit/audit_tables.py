#!/usr/bin/env python3
"""Reproduce the finite prior-art table audit; no construction search.

Usage: python audit_tables.py INPUT_DIRECTORY [OUTPUT_JSON]

Inputs are fixed, published CSV snapshots and an optional prior 87-row array.
The script only evaluates standard monotone reductions and checks an existing
array. It does not generate candidates or assert a lower bound on CAN.
"""
from __future__ import annotations

import csv
import hashlib
import itertools
import json
import sys
from collections import deque
from decimal import Decimal
from pathlib import Path


def integer(text: str) -> int:
    value = Decimal(text)
    assert value == value.to_integral_value(), text
    return int(value)


def parameters(row: dict) -> tuple[int, int, int, int]:
    return tuple(integer(row[key]) for key in ("N", "t", "k", "v"))


def reductions(N: int, t: int, k: int, v: int) -> dict:
    """Least guaranteed N under all orders of fusion and derivation.

    Fusion: (N,t,k,v) -> (N-2,t,k,v-1), for v>3, CKRS 2010 Lemma 3.1.
    Derivation: (N,t,k,v) -> (floor(N/v),t-1,k-1,v), for t>3.
    At any visited state, forgetting extra strength, collapsing extra symbols,
    and truncating columns already gives the requested strength/alphabet/width.
    """
    if t < 3 or k < 40 or v < 3:
        return {}
    todo = deque([(N, t, k, v, [])])
    best_at = {}
    winner = None
    while todo:
        n, strength, width, alphabet, path = todo.popleft()
        state = (strength, width, alphabet)
        if n >= best_at.get(state, float("inf")):
            continue
        best_at[state] = n
        if winner is None or n < winner["implied_N"]:
            winner = {"implied_N": n, "state": [n, strength, width, alphabet], "path": path}
        if alphabet > 3:
            todo.append((n-2, strength, width, alphabet-1, path+[f"fuse {alphabet} to {alphabet-1}"]))
        if strength > 3 and width > 40:
            todo.append((n//alphabet, strength-1, width-1, alphabet, path+[f"derive at alphabet {alphabet}"]))
    return winner


def inspect_csv(path: Path) -> dict:
    rows = list(csv.DictReader(path.open(encoding="utf-8-sig")))
    eligible = []
    for row_number, row in enumerate(rows, 2):
        N, t, k, v = parameters(row)
        if t >= 3 and k >= 40 and v >= 3:
            eligible.append((row_number, row, (N, t, k, v)))
    direct = min(eligible, key=lambda item: item[2][0]) if eligible else None
    outcomes = []
    for row_number, row, params in eligible:
        outcomes.append({"csv_line": row_number, "source_parameters": params,
                         "source_row": row, **reductions(*params)})
    best_reduced = min(outcomes, key=lambda x: x["implied_N"]) if outcomes else None
    group_best = {}
    for outcome in outcomes:
        N, t, k, v = outcome["source_parameters"]
        group = "ternary_t3" if (t, v) == (3, 3) else "larger_alphabet_t3" if t == 3 else "ternary_higher_strength" if v == 3 else "larger_alphabet_higher_strength"
        if group not in group_best or outcome["implied_N"] < group_best[group]["implied_N"]:
            group_best[group] = outcome
    return {
        "filename": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "total_rows": len(rows), "eligible_direct_rows": len(eligible),
        "t3_v3_k40plus_rows": sum(x[2][1] == 3 and x[2][3] == 3 for x in eligible),
        "direct_minimum": {"csv_line": direct[0], "parameters": direct[2], "row": direct[1]} if direct else None,
        "best_guaranteed_reduction": best_reduced, "group_best": group_best,
        "equal_or_stronger_rows": [x for x in outcomes if x["implied_N"] <= 86],
    }


def inspect_prior_array(path: Path) -> dict:
    rows = []
    for line in path.read_text().splitlines():
        if not line.strip() or line.lstrip().startswith(("#", "C ")):
            continue
        vals = [int(x) for x in line.replace(",", " ").split()]
        # Canonical ca-tools files have only array entries, but tolerate a header.
        if not rows and len(vals) == 4 and vals in ([87, 3, 40, 3], [87, 40, 3, 3]):
            continue
        rows.append(vals)
    assert len(rows) == 87 and all(len(row) == 40 for row in rows)
    assert all(x in (0, 1, 2) for row in rows for x in row)
    missing = 0
    essential = [0]*len(rows)
    for a, b, c in itertools.combinations(range(40), 3):
        witnesses = [[] for _ in range(27)]
        for index, row in enumerate(rows):
            witnesses[9*row[a]+3*row[b]+row[c]].append(index)
        missing += sum(not ids for ids in witnesses)
        for ids in witnesses:
            if len(ids) == 1:
                essential[ids[0]] += 1
    return {"file": path.name, "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
            "rows": len(rows), "columns": 40, "requirements": 9880*27,
            "missing_requirements": missing, "min_unique_witnesses_per_row": min(essential),
            "max_unique_witnesses_per_row": max(essential), "total_unique_witnesses": sum(essential),
            "redundant_row_indices_zero_based": [i for i, n in enumerate(essential) if n == 0],
            "unique_witnesses_by_row": essential}


def main():
    directory = Path(sys.argv[1])
    names = ["ca_frame.csv", "ca_table.csv", "colbourn_catalogue.csv", "derived.csv", "bai_records.csv"]
    results = {"purpose": "Finite numerical prior-art implications, not an optimization search or proof of novelty",
               "threshold": {"N_max": 86, "t_min": 3, "k_min": 40, "v_min": 3},
               "tables": [inspect_csv(directory/name) for name in names if (directory/name).is_file()]}
    prior = directory/"CA_87_3_40_3.txt"
    if prior.is_file():
        results["prior_array_check"] = inspect_prior_array(prior)
    text = json.dumps(results, indent=2)+"\n"
    if len(sys.argv) > 2:
        Path(sys.argv[2]).write_text(text)
    else:
        print(text)


if __name__ == "__main__":
    main()
