#!/usr/bin/env python3
"""Run a command; record elapsed time and sampled Linux process-tree memory."""
import json
from pathlib import Path
import resource
import subprocess
import sys
import time

output = Path(sys.argv[1])
command = sys.argv[2:]
start = time.monotonic()
proc = subprocess.Popen(command)
peak_rss = peak_pss = 0
samples = 0


def tree_memory(pid, seen):
    if pid in seen:
        return 0, 0
    seen.add(pid)
    root = Path('/proc') / str(pid)
    rss = pss = 0
    try:
        for line in (root / 'smaps_rollup').read_text().splitlines():
            if line.startswith('Rss:'):
                rss = int(line.split()[1])
            elif line.startswith('Pss:'):
                pss = int(line.split()[1])
        children = set()
        for task in (root / 'task').iterdir():
            try:
                children.update(map(int, (task / 'children').read_text().split()))
            except (FileNotFoundError, ProcessLookupError):
                pass
        for child in children:
            child_rss, child_pss = tree_memory(child, seen)
            rss += child_rss
            pss += child_pss
    except (FileNotFoundError, ProcessLookupError, PermissionError):
        pass
    return rss, pss


while proc.poll() is None:
    rss, pss = tree_memory(proc.pid, set())
    peak_rss = max(peak_rss, rss)
    peak_pss = max(peak_pss, pss)
    samples += 1
    time.sleep(0.2)

usage = resource.getrusage(resource.RUSAGE_CHILDREN)
report = {
    'command': command,
    'exit_code': proc.returncode,
    'elapsed_seconds': round(time.monotonic() - start, 3),
    'largest_process_max_rss_kib': usage.ru_maxrss,
    'sampled_peak_tree_rss_kib': peak_rss,
    'sampled_peak_tree_pss_kib': peak_pss,
    'sampling_interval_seconds': 0.2,
    'samples': samples,
}
output.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2), flush=True)
sys.exit(proc.returncode)
