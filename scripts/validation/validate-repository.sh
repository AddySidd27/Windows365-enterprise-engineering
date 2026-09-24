#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$repo_root"

echo "Validating Draw.io XML..."
while IFS= read -r file; do
  python3 -c 'import sys, xml.etree.ElementTree as ET; ET.parse(sys.argv[1])' "$file"
done < <(find architecture/diagrams/source -type f -name '*.drawio' -print)

echo "Checking diagram exports..."
python3 - <<'PYCODE'
from pathlib import Path
import struct
import xml.etree.ElementTree as ET
sources = sorted(Path('architecture/diagrams/source').glob('*.drawio'))
assert len(sources) == 10, f'Expected 10 diagram sources, found {len(sources)}'
for source in sources:
    svg = Path('architecture/diagrams/exported') / (source.stem + '.svg')
    png = Path('architecture/diagrams/exported') / (source.stem + '.png')
    assert svg.is_file() and png.is_file(), f'Missing export for {source.name}'
    ET.parse(svg)
    data = png.read_bytes()
    assert data.startswith(b'\x89PNG\r\n\x1a\n') and len(data) >= 24, f'Invalid PNG: {png}'
    width, height = struct.unpack('>II', data[16:24])
    assert width >= 1000 and height >= 600, f'Low-resolution PNG: {png} ({width}x{height})'
PYCODE

echo "Checking required use-case sections..."
section_failure=0
while IFS= read -r file; do
  for heading in Evidence Rollback References; do
    if ! rg -q "^## ${heading}$" "$file"; then
      echo "$file is missing: $heading"
      section_failure=1
    fi
  done
  if ! rg -qi '^## .*troubleshoot|^## Common failures|^## Risks and controls' "$file"; then
    echo "$file is missing: Troubleshooting"
    section_failure=1
  fi
  if ! rg -q '^> \*\*Status:\*\*' "$file"; then
    echo "$file is missing: Status"
    section_failure=1
  fi
done < <(find use-cases -type f -name 'UC-*.md' -print)

if [[ "$section_failure" -ne 0 ]]; then
  exit 1
fi

echo "Checking local Markdown links..."
python3 - <<'PY'
from pathlib import Path
import re

errors = []
for file in Path('.').rglob('*.md'):
    for target in re.findall(r'\[[^\]]+\]\(([^)]+)\)', file.read_text(encoding='utf-8')):
        if target.startswith(('http://', 'https://', '#', 'mailto:')):
            continue
        path = (file.parent / target.split('#', 1)[0]).resolve()
        if not path.exists():
            errors.append((file, target))

for file, target in errors:
    print(f'{file}: missing local link target: {target}')
raise SystemExit(1 if errors else 0)
PY

echo "Checking for unfinished verification placeholders..."
if rg -n "Needs current Microsoft documentation verification|TODO|TBD" --glob '*.md'; then
  echo "Unresolved placeholders found."
  exit 1
fi

echo "Checking for blocked marketing wording..."
blocked_wording="$(rg -n -i \
  '\b(leverage|leverages|leveraging|robust|seamless|comprehensive|cutting-edge|best-in-class|holistic)\b|in today.s digital landscape|demonstrates a deep understanding' \
  README.md docs use-cases \
  --glob '!docs/writing-standard.md' || true)"

if [[ -n "$blocked_wording" ]]; then
  printf '%s\n' "$blocked_wording"
  echo "Blocked wording found. Rewrite it in simple English."
  exit 1
fi

echo "Checking evidence claims..."
python3 - <<'PYCODE'
from pathlib import Path
import re
for case in Path('use-cases').glob('UC-*.md'):
    body = case.read_text()
    status = next((line for line in body.splitlines() if line.startswith('> **Status:**')), '')
    if 'complete with evidence' not in status.lower():
        continue
    records = list(Path('evidence').glob(f'{case.name[:5]}-????-??-??-test.md'))
    if not records or not any(f'../evidence/{record.name}' in body for record in records):
        raise SystemExit(f'{case}: completed claim requires a linked, dated evidence record')
PYCODE

echo "Checking for common sensitive values..."
potential_secrets="$(rg -n --hidden -i \
  '(client_secret|password\s*=|BEGIN (RSA|OPENSSH|EC) PRIVATE KEY|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})' \
  --glob '!scripts/validation/validate-repository.sh' \
  --glob '!architecture/icons/**' \
  --glob '!*.drawio' || true)"

potential_secrets="$(printf '%s\n' "$potential_secrets" | rg -v \
  '0af06dc6-e4b5-4f28-818e-e78e62d137a5|9cdead84-a844-4324-93f2-b2e6bb768d07|270efc09-cd0d-444b-a71f-39af4910ec45' || true)"

if [[ -n "$potential_secrets" ]]; then
  printf '%s\n' "$potential_secrets"
  echo "Potential sensitive value found. Review before publishing."
  exit 1
fi

echo "Repository validation passed."
