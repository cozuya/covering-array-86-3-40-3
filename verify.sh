#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
if [[ -n "${LEAN_BIN:-}" ]]; then
  export PATH="$LEAN_BIN:$PATH"
elif [[ -x .tools/lean-4.28.0-linux/bin/lean ]]; then
  export PATH="$PWD/.tools/lean-4.28.0-linux/bin:$PATH"
fi
unset PYTHONOPTIMIZE
mkdir -p .build
exec > >(tee .build/verification.log) 2>&1
lean --version
[[ "$(lean -V)" == "4.28.0" ]]
[[ "$(lean --githash)" == "7e01a1bf5c70fc6167d49c345d3bf80596e9a79b" ]]
python3 scripts/check-package.py --sources-only
python3 scripts/generate.py --check
python3 scripts/audit.py
lake clean
python3 scripts/measure.py .build/build-metrics.json lake --wfail build CA86 CA86.Negative
python3 scripts/measure.py .build/audit-metrics.json lake env lean -j1 -t0 Verification.lean | tee .build/kernel-check.log
python3 scripts/measure.py .build/replay-metrics.json lake env leanchecker --fresh CA86
if lake env lean -j1 tests/NegativeMustFail.lean > .build/negative-control.log 2>&1; then
  echo 'ERROR: invalid negative control was accepted.'
  exit 1
fi
cat .build/negative-control.log
python3 scripts/audit.py .build/kernel-check.log .build/negative-control.log
bash crosscheck/run.sh | tee .build/crosscheck.log
python3 scripts/record-verification.py
echo 'VERIFY_EXIT_CODE=0'
echo 'VERIFICATION PASSED: clean build, fresh kernel replay, exact statements, axioms, and negative controls.'
