"""Parameter arithmetic for published recurrences; no array generation or search.

We intentionally substitute LOWER bounds for strength-two ingredient sizes.
The resulting closure is optimistic, so failure to reach 40 columns certifies
that the inspected recurrences + listed seeds cannot do so within 28 rows.
This says nothing about undiscovered ingredients or constructions outside them.

Convention: C2(k) means Castoldi's CSN(2,k,Z3), requiring differences
0, 1, and 2 for every column pair (amc.2024005 definition / Theorem 2.2).
It does NOT mean a nonzero-only DCA. The subtraction of 1 from each C2
ingredient in Theorem 4.4 already accounts for its normalized zero row.
"""
import json
from pathlib import Path

ROOT = Path(__file__).parent
BUDGET = 28

def ingredient_floor(k):
    # Full-CS sizes: exact C2(3)=3, C2(4)=4, C2(5)=5 + monotonicity.
    # Even if nonzero-only DCAs have 2/3/4 rows, they are not CS inputs
    # until zero differences are supplied. Do not subtract one again.
    return 3 if k <= 3 else 4 if k == 4 else 5

# All strongest ternary strength-three seeds in inspected amc.2024005.
# C3(4)=9 (Prop2.6); C3(6)=11 (Prop6.9); C3(8)<=14 (Ex6.11).
# Projection supplies k=3,5,7. Cor4.2/4.3/4.5/4.6 and the q=3 table
# entries are dominated by these seeds or by the included recurrences.
cost = {4: 9, 6: 11, 8: 14}
history = {4: 'Prop2.6', 6: 'Prop6.9', 8: 'Ex6.11'}

def put(k, n, why):
    if n > BUDGET or k < 3 or n >= cost.get(k, BUDGET+1):
        return False
    cost[k] = n
    history[k] = why
    return True

rounds = 0
while True:
    rounds += 1
    changed = False
    states = list(cost.items())
    for k, n in states:
        for j in range(3, k):
            changed |= put(j, n, f'projection from {k}')
        changed |= put(k+1, n+6, f'Thm3.1 from {k}')
        changed |= put(2*k, n+2*ingredient_floor(k), f'Thm4.1 from {k}')
        for ell, m in states:
            changed |= put(k+ell-2, n+m-1, f'Thm5.1 from {k},{ell}')
            changed |= put(k*ell, n+m+(ingredient_floor(k)-1)*(ingredient_floor(ell)-1)-1,
                           f'Thm4.4 from {k},{ell}')
    if not changed:
        break

result = {
    'scope': 'DOI10.3934/amc.2024005 ternary strength-three seeds + Thm3.1/4.1/4.4/5.1 and projection',
    'type': 'optimistic relaxation, NOT a valid upper-bound table',
    'ingredient_convention': 'Castoldi CS: all differences, including zero; not nonzero-only DCA',
    'seeds': {'k4': 9, 'k6': 11, 'k8': 14},
    'projection': 'all k>=3 below every available column count, retaining full row count',
    'strength_two_ingredient_floor': {'k3': 3, 'k4': 4, 'k_ge_5': 5},
    'budget': BUDGET,
    'closure_rounds': rounds,
    'maximum_columns_in_relaxed_closure': max(cost),
    'reaches_40': 40 in cost,
    'optimistic_costs': {str(k): {'rows': cost[k], 'last_step': history[k]} for k in sorted(cost)},
}
(ROOT/'published_scheme_closure.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
