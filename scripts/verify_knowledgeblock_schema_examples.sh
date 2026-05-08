#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_base.sh
for f in schemas/knowledgeblock-status.schema.json schemas/knowledgeblock-evidence-ref.schema.json schemas/knowledgeblock-review-state.schema.json examples/knowledgeblocks/technical-knowledgeblock.json examples/knowledgeblocks/legal-knowledgeblock.json examples/knowledgeblocks/financial-knowledgeblock.json examples/knowledgeblocks/research-knowledgeblock.json; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from pathlib import Path
import json
items=list(Path("examples/knowledgeblocks").glob("*-knowledgeblock.json"))
assert len(items) >= 4
for p in items:
    data=json.loads(p.read_text())
    assert data["question"]
print("🟢 KnowledgeBlock schema examples smoke test passed")
PY
echo "🟢 KnowledgeBlock schema examples verified"
