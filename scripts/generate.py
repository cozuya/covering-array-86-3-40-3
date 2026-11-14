#!/usr/bin/env python3
"""Deterministically embed the authenticated matrix and supply row witnesses.
All generated proof obligations are discharged by Lean's kernel, not Python.
"""
from pathlib import Path
import argparse
import hashlib

p = Path(__file__).resolve().parent.parent
parser = argparse.ArgumentParser()
parser.add_argument('--check', action='store_true', help='compare generated sources without writing')
args = parser.parse_args()
if not __debug__:
    raise RuntimeError('Run this generator without Python optimization (-O).')
def emit(path, content):
    if args.check:
        assert path.read_text() == content, f'Generated file differs: {path}'
    else:
        path.write_text(content)
raw = (p / 'CA_86_3_40_3.txt').read_bytes()
assert hashlib.sha256(raw).hexdigest() == '7dc7ab1e231dce3cde5cc1c6b35c4911f34145fd4dfe5d80f8ea26b235b27f8a'

a=[list(map(int,l.split()))for l in (p/'CA_86_3_40_3.txt').read_text().splitlines()]
assert len(a) == 86 and all(len(row) == 40 and all(x in (0, 1, 2) for x in row) for row in a)
z = sum(x << (2 * (r * 40 + c)) for r, row in enumerate(a) for c, x in enumerate(row))
assert all(((z >> (2 * (r * 40 + c))) & 3) == x for r, row in enumerate(a) for c, x in enumerate(row))
emit(p / 'CA86/Certificate.lean', 'import Init\n\nnamespace CA86\n\n/-- The 3440 original entries, as two-bit digits in row-major order. -/\ndef packedCertificate : Nat :=\n  ' + str(z) + '\n\n/-- The original matrix, decoded from its immutable packed numeral. -/\ndef certificate (r : Fin 86) (c : Fin 40) : Fin 3 :=\n  ⟨((packedCertificate >>> (2 * (r.val * 40 + c.val))) &&& 3) % 3,\n    Nat.mod_lt _ (by decide)⟩\n\nend CA86\n')
d=p/'CA86/Blocks';d.mkdir(exist_ok=True)
requirements = 0
def combine(terms):
 s='(by intro x; exact Fin.elim0 x)'
 for h in reversed(terms): s='(Fin.forall_fin_succ.mpr ⟨'+h+', '+s+'⟩)'
 return s
for i in range(40):
 s='import CA86.Certificate\nimport CA86.Checker\n'+(f'import CA86.Blocks.Block{i-3:02}\n' if i >= 3 else '')+'\nnamespace CA86\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\n'
 for j in range(i+1,39):
  ws=[]
  for k in range(40):
   if k<=j: ws.append('0');continue
   w=[None]*27
   for r,row in enumerate(a):
    t=row[i]*9+row[j]*3+row[k]
    if w[t] is None:w[t]=r
   assert None not in w
   requirements += 27
   packed = sum(r << (7 * t) for t, r in enumerate(w))
   assert all(((packed >> (7*t)) & 127) == r for t, r in enumerate(w))
   ws.append(str(packed))
  s+=f'\nprivate def ws_{i}_{j} : Array Nat := #[\n'+',\n'.join('  '+x for x in ws)+'\n]\n'
  s+=f'\nprivate theorem checked_{i}_{j} : checkPair certificate {i} {j} ws_{i}_{j} = true := by decide +kernel\n'
  s+=f'\nprivate theorem pair_{i}_{j} : PairCovered certificate {i} {j} :=\n  checkPair_sound checked_{i}_{j}\n'
 terms=[]
 for j in range(40):
  if i<j<39: terms.append(f'(fun _ => pair_{i}_{j})')
  elif j==39: terms.append('(by intro _ l hj; exact False.elim ((by intro h; have := l.isLt; have := h; omega : ¬ ((39 : Fin 40) < l)) hj))')
  else:terms.append(f'(fun h => False.elim ((by decide : ¬ (({i} : Fin 40) < {j})) h))')
 s+=f'\ntheorem block_{i} : ∀ j : Fin 40, ({i} : Fin 40) < j → PairCovered certificate {i} j :=\n  '+combine(terms)+'\n\nend CA86\n'
 emit(d/f'Block{i:02}.lean', s)

assert requirements == 266760
s = '\n'.join(f'import CA86.Blocks.Block{i:02}' for i in (37,38,39))
s += '\n\nnamespace CA86\nset_option maxRecDepth 100000\n\n'
s += 'theorem all_blocks : ∀ i j : Fin 40, i < j → PairCovered certificate i j :=\n  ' + combine([f'block_{i}' for i in range(40)]) + '\n\n'
s += '/-- The explicit authenticated 86 by 40 ternary matrix is a covering array. -/\ntheorem ca86_covering : IsCoveringArray certificate := by\n  intro i j l hij hjl a b c\n  exact all_blocks i j hij l hjl a b c\n\ntheorem ca86_existence : Feasible 86 40 3 :=\n  ⟨certificate, ca86_covering⟩\n\n/-- The least feasible number of rows for strength three is at most 86. -/\ntheorem CAN_3_40_3_le_86 : CAN₃ 40 3 ≤ 86 :=\n  CAN₃_le_of_feasible ca86_existence\n\n/-- Explicitly records the feasibility and minimality semantics of CAN₃ here. -/\ntheorem CAN_3_40_3_spec :\n    Feasible (CAN₃ 40 3) 40 3 ∧\n      ∀ n, Feasible n 40 3 → CAN₃ 40 3 ≤ n :=\n  CAN₃_spec ⟨86, ca86_existence⟩\n\nend CA86\n'
emit(p / 'CA86.lean', s)
print(f"Authenticated 86 × 40 certificate; {requirements:,} witness requirements; generated sources {'match' if args.check else 'written'}.")
