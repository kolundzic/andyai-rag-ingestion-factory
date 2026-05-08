#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_governance.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.evidence import attach_evidence
assert attach_evidence({"id":"kb"}, [{"document_id":"doc"}])["has_evidence"] is True
print("🟢 KnowledgeBlock evidence smoke test passed")
PY
echo "🟢 KnowledgeBlock evidence verified"
