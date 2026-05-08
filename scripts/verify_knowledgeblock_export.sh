#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_review_queue.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.export import to_jsonl
assert to_jsonl([{"id":"kb"}])
print("🟢 KnowledgeBlock export smoke test passed")
PY
echo "🟢 KnowledgeBlock export verified"
