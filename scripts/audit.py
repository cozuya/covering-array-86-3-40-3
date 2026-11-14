#!/usr/bin/env python3
"""Audit proof mechanisms and the exact reported axiom sets."""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = {
    'checkPair_sound': '[propext, Quot.sound]',
    'ca86_covering': '[propext, Quot.sound]',
    'ca86_existence': '[propext, Quot.sound]',
    'CAN_3_40_3_le_86': '[propext, Classical.choice, Quot.sound]',
    'CAN_3_40_3_spec': '[propext, Classical.choice, Quot.sound]',
    'zeroArray_not_covering': '[propext]',
    'zeroArray_checker_rejected': '[propext]',
    'Verification.exact_statement': '[propext, Quot.sound]',
    'Verification.exact_bound': '[propext, Classical.choice, Quot.sound]',
}


def require(condition, message):
    if not condition:
        raise SystemExit('FAIL: ' + message)


def main():
    files = [ROOT / name for name in ('CA86.lean', 'Audit.lean', 'Verification.lean')]
    files += sorted((ROOT / 'CA86').rglob('*.lean'))
    for path in files:
        require(not re.search(r'\b(sorry|sorryAx|admit|axiom|unsafe|native_decide)\b',
                              path.read_text()), f'Forbidden proof mechanism: {path}')
    checks = sum(len(re.findall(r'private theorem checked_\d+_\d+', p.read_text()))
                 for p in (ROOT / 'CA86/Blocks').glob('*.lean'))
    require(checks == 741, f'Expected 741 nonvacuous column-pair checks, got {checks}')
    print(f'SOURCE_AUDIT=PASS: {len(files)} Lean files, {checks} kernel pair checks')
    if len(sys.argv) == 1:
        return
    require(len(sys.argv) == 3, 'Usage: audit.py [AXIOM_LOG NEGATIVE_LOG]')
    audit = Path(sys.argv[1]).read_text()
    actual = dict(re.findall(r"'CA86\.([^']+)' depends on axioms: (\[[^\]]*\])", audit))
    require(actual == EXPECTED, f'Axiom inventory mismatch: {actual}')
    require(not re.search(r'sorryAx|ofReduceBool|trustCompiler', audit), 'Unexpected trusted axiom')
    negative = Path(sys.argv[2]).read_text()
    require('Tactic `decide` proved that the proposition' in negative and
            'is false' in negative and 'zeroArray' in negative,
            'Negative control failed for an unexpected reason')
    print('AXIOM_AUDIT=PASS: all nine declarations match their expected axiom sets')
    print('NEGATIVE_CONTROL=PASS: invalid checker-true proof rejected as false')


if __name__ == '__main__':
    main()
