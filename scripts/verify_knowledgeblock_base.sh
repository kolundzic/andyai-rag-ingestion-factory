#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — KnowledgeBlock Base"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f src/rag_ingestion_factory/knowledgeblocks/models.py
test -f src/rag_ingestion_factory/knowledgeblocks/lifecycle.py
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.models import sample_knowledgeblock
kb = sample_knowledgeblock()
assert kb.id == "kb-demo-001"
assert kb.evidence_refs
print("🟢 KnowledgeBlock model smoke test passed")
PY
echo "🟢 KnowledgeBlock base verified"
