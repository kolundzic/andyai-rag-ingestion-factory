#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_canonical_merge.sh
test -f src/rag_ingestion_factory/knowledgeblocks/governance.py
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.governance import attach_governance
assert attach_governance({"id":"kb"}, ["internal"])["governance_tags"] == ["internal"]
print("🟢 KnowledgeBlock governance smoke test passed")
PY
echo "🟢 KnowledgeBlock governance verified"
