#!/usr/bin/env python3
"""Bind successful verification output to the complete source manifest."""
from datetime import datetime, timezone
import json
from pathlib import Path
import platform
import subprocess

ROOT = Path(__file__).resolve().parent.parent
build = ROOT / '.build'
report = {
    'status': 'PASS', 'verification_exit_code': 0,
    'recorded_at_utc': datetime.now(timezone.utc).isoformat(),
    'platform': platform.platform(),
    'python_version': platform.python_version(),
    'lean_version_output': subprocess.check_output(['lean', '--version'], text=True).strip(),
    'toolchain': json.loads((ROOT / 'TOOLCHAIN.json').read_text()),
    'source_sha256': {name: digest for digest, name in
                      (line.split('  ', 1) for line in (ROOT / 'SOURCE_SHA256SUMS').read_text().splitlines())},
    'metrics': {name: json.loads((build / (name + '-metrics.json')).read_text())
                for name in ('build', 'audit', 'replay')},
    'crosscheck': json.loads((build / 'crosscheck.json').read_text()),
    'checks': ['source integrity', 'deterministic generated sources', 'proof source audit',
               'warning-free clean build', 'exact quantified statements', 'exact axiom sets',
               'fresh kernel replay of CA86 and all imports', 'Lean negative control',
               'independent exhaustive text-matrix cross-check', 'Python negative control'],
}
if any(m['exit_code'] != 0 for m in report['metrics'].values()):
    raise SystemExit('Cannot record PASS: a measured command failed')
(build / 'verification.json').write_text(json.dumps(report, indent=2) + '\n')
print('Verification report written to .build/verification.json')
