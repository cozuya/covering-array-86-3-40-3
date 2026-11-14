# Reproduce the verification

## Requirements and pinned toolchain

Use Linux x86_64 / WSL, Bash, Python 3, and Lean 4.28.0 at commit
`7e01a1bf5c70fc6167d49c345d3bf80596e9a79b`. There are no Mathlib, Lake-package,
or Python-package dependencies. Installing the Linux release also needs curl, tar,
coreutils, and either zstd or Python 3.14's standard-library zstd decoder.

```sh
bash scripts/install-lean.sh
export PATH="$PWD/.tools/lean-4.28.0-linux/bin:$PATH"
./verify.sh
python3 scripts/check-package.py
```

The installer verifies the archive's SHA-256 against [TOOLCHAIN.json](TOOLCHAIN.json)
and checks the installed executable's version and commit. An existing matching
installation works with `LEAN_BIN=/absolute/path/to/bin ./verify.sh`.

## What the main command checks

`./verify.sh` performs these operations, stopping on any unexpected failure:

1. Check the complete source manifest, adapted archive identities, and Lean version.
2. Authenticate the matrix and compare every deterministic generated source.
3. Audit the Lean sources for forbidden proof mechanisms and the pair-check inventory.
4. Delete project build outputs and run `lake --wfail build CA86 CA86.Negative`.
5. Check [Verification.lean](Verification.lean), including exact statement restatements
   and nine exact theorem axiom sets.
6. Run `lake env leanchecker --fresh CA86`, replaying the entire main import closure.
7. Require [the invalid control proof](tests/NegativeMustFail.lean) to fail specifically
   because kernel decision proves its proposition false.
8. Independently enumerate all requirements in the text matrix and reject the zero matrix.
9. Write a machine-readable report binding the run to [SOURCE_SHA256SUMS](SOURCE_SHA256SUMS).

Output goes to `.build/verification.log`, `.build/kernel-check.log`,
`.build/negative-control.log`, `.build/crosscheck.log`, three resource measurements,
and `.build/verification.json`. These local products do not overwrite the committed
[evidence/](evidence) or the adapted [historical logs](provenance/lean/logs).

## Individual checks

```sh
sha256sum --check SOURCE_SHA256SUMS
python3 scripts/generate.py --check
python3 scripts/audit.py
lake --wfail build CA86 CA86.Negative
lake env lean -j1 -t0 Verification.lean
lake env leanchecker --fresh CA86
bash crosscheck/run.sh
```

`python3 scripts/generate.py` optionally rewrites the generated certificate, blocks,
and main module. It never changes the canonical text matrix. No generation is
required to compile the already supplied Lean files.

## Resource use

The original handoff reports about 54 seconds for a clean build and 159 seconds for
fresh kernel replay on its workstation. Its build peaked at about 3.49 GiB summed
process-tree PSS and 1.58 GiB RSS for the largest process. Allow at least 6 GiB available
memory for a comfortable full run; actual timing depends on the machine.
Three import chains limit concurrent block compilation to three Lean processes,
each configured with `-j1`.

`scripts/measure.py` samples process-tree RSS and PSS every 0.2 seconds and reports
the child process high-water RSS. Summed RSS double-counts shared pages; PSS apportions
them. See [VERIFICATION_REPORT.md](VERIFICATION_REPORT.md) for this package's fresh run.

## Prior-art audit

The original scripts write some results alongside their inputs. To preserve the
included source evidence, reproduce them in a scratch copy:

```sh
mkdir -p .build/prior-art
cp -a prior-art/audit/. .build/prior-art/
python3 .build/prior-art/audit_tables.py .build/prior-art/inputs .build/prior-art/reproduced_audit.json
python3 .build/prior-art/lineage/verify_prior_arrays.py
python3 .build/prior-art/lineage/check_published_scheme_closure.py
```

These checks scan fixed published data, verify six predecessor arrays, and perform
the documented recursive-scheme arithmetic. They do not repeat the web searches,
search for a new array, or prove historical novelty. The scheme calculation uses
optimistically cheap ingredients and is explicitly not an upper-bound table.

## Recorded local verification

The successful local run is preserved in [evidence/](evidence). Use `./verify.sh`
to repeat the full verification or `bash crosscheck/run.sh` to run the independent
matrix check without Lean.
