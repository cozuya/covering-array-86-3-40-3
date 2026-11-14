#!/usr/bin/env python3
"""Check source inventory, supplied artifacts, documentation links, and recorded evidence."""
import hashlib
import json
import os
from pathlib import Path
import re
import sys
from urllib.parse import unquote, urlsplit
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parent.parent
GENERATED = {'.git', '.lake', '.tools', '.build', '__pycache__'}
DOCS = {
    'README.md', 'PROOF.md', 'PRIOR_ART.md', 'PROVENANCE.md', 'REPRODUCE.md',
    'VERIFICATION_REPORT.md', 'crosscheck/README.md', 'original/README.md',
    'prior-art/README.md', 'provenance/README.md',
}
EXPECTED_LEAN = {
    'CA86.lean', 'Audit.lean', 'Verification.lean', 'tests/NegativeMustFail.lean',
    *(f'CA86/{name}.lean' for name in ('Basic', 'Certificate', 'Checker', 'Negative')),
    *(f'CA86/Blocks/Block{i:02}.lean' for i in range(40)),
}


def require(condition, message):
    if not condition:
        raise SystemExit('FAIL: ' + message)


def files():
    result = set()
    for parent, dirs, names in os.walk(ROOT):
        dirs[:] = [n for n in dirs if n not in GENERATED]
        for name in names:
            path = Path(parent) / name
            require(not path.is_symlink(), 'Package contains a symlink: ' + str(path))
            result.add(path.relative_to(ROOT).as_posix())
    return result


def source_files():
    return {p for p in files() if p not in DOCS | {'SOURCE_SHA256SUMS'}
            and not p.startswith('evidence/')}


def main():
    require(sys.argv[1:] in ([], ['--sources-only'], ['--write-manifest']), 'Unexpected arguments')
    mode = sys.argv[1:]
    sources = source_files()
    if mode == ['--write-manifest']:
        (ROOT / 'SOURCE_SHA256SUMS').write_text(''.join(
            f'{hashlib.sha256((ROOT / p).read_bytes()).hexdigest()}  {p}\n' for p in sorted(sources)))
        print(f'Wrote {len(sources)} source hashes.')
        return
    require({p for p in sources if p.endswith('.lean')} == EXPECTED_LEAN,
            'Lean module inventory differs from the full 48-file project')
    hashes = {}
    for line in (ROOT / 'SOURCE_SHA256SUMS').read_text().splitlines():
        digest, name = line.split('  ', 1)
        require(name in sources and name not in hashes, 'Invalid manifest entry: ' + name)
        require(re.fullmatch(r'[0-9a-f]{64}', digest) is not None, 'Invalid SHA-256')
        require(hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == digest,
                'Hash mismatch: ' + name)
        hashes[name] = digest
    require(set(hashes) == sources, 'Source manifest is incomplete')
    with ZipFile(ROOT / 'provenance/lean/ca86-lean-handoff.zip') as archive:
        require(archive.testzip() is None, 'Corrupt adapted Lean handoff')
        for name in archive.namelist():
            rel = Path(name).relative_to('ca86-lean').as_posix()
            if rel.endswith('.lean') or rel in {'CA_86_3_40_3.txt', 'lean-toolchain',
                                                'lakefile.toml', 'lake-manifest.json'}:
                require((ROOT / rel).read_bytes() == archive.read(name),
                        'Lean source differs from adapted handoff: ' + rel)
    audit = ROOT / 'prior-art/audit'
    with ZipFile(ROOT / 'prior-art/CA86_Audit_Evidence.zip') as archive:
        require(archive.testzip() is None, 'Corrupt adapted prior-art ZIP')
        members = set()
        for info in archive.infolist():
            rel = Path(info.filename).relative_to('ca86_novelty').as_posix()
            members.add(rel)
            require((audit / rel).read_bytes() == archive.read(info),
                    'Extracted audit changed: ' + rel)
        require(members == {p.relative_to(audit).as_posix() for p in audit.rglob('*') if p.is_file()},
                'Extracted audit inventory differs from the adapted ZIP')
    for entry in json.loads((audit / 'SHA256SUMS.json').read_text()):
        raw = (audit / entry['path']).read_bytes()
        require(len(raw) == entry['bytes'] and hashlib.sha256(raw).hexdigest() == entry['sha256'],
                'Audit manifest mismatch: ' + entry['path'])
    require((ROOT / 'original/CA_87_3_40_3.txt').read_bytes() ==
            (audit / 'inputs/CA_87_3_40_3.txt').read_bytes(), 'Prior-array copy differs')
    links = 0
    for name in sorted(DOCS):
        path = ROOT / name
        require(path.is_file(), 'Missing documentation: ' + name)
        text = re.sub(r'```.*?```', '', path.read_text(), flags=re.S)
        for match in re.finditer(r'\[[^\]\n]+\]\(([^)]+)\)', text):
            target = urlsplit(match.group(1).strip().strip('<>'))
            if target.scheme or target.netloc:
                continue
            linked = (path.parent / unquote(target.path)).resolve() if target.path else path
            pending_evidence = (mode == ['--sources-only'] and linked.is_relative_to(ROOT / 'evidence'))
            require(linked.is_relative_to(ROOT) and (linked.exists() or pending_evidence),
                    f'Broken or external local link in {name}: {match.group(1)}')
            links += 1
    if mode != ['--sources-only']:
        report = json.loads((ROOT / 'evidence/verification.json').read_text())
        require(report['status'] == 'PASS' and report['verification_exit_code'] == 0,
                'Recorded verification failed')
        require(report['source_sha256'] == hashes, 'Recorded evidence covers different sources')
        require(report['toolchain'] == json.loads((ROOT / 'TOOLCHAIN.json').read_text()),
                'Recorded toolchain differs')
        require(report['crosscheck']['missing_requirements'] == 0, 'Cross-check did not pass')
        for name, marker in [('verification.log', 'VERIFY_EXIT_CODE=0'),
                             ('crosscheck.log', 'NEGATIVE_CONTROL=PASS')]:
            require(marker in (ROOT / 'evidence' / name).read_text(), 'Missing success marker: ' + name)
    print(f'PACKAGE_CHECK=PASS: {len(hashes)} source hashes, 48 Lean files, '
          f'{links} local links, and byte-identical adapted archives')


if __name__ == '__main__':
    main()
