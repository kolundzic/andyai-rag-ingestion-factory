#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_knowledgeblock_evidence.sh
test -f apps/knowledgefactory-web/app/knowledgeblocks/review/page.tsx
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.knowledgeblocks.review_queue import queue_review
assert queue_review({"id":"kb"})["review_status"] == "needs_review"
print("🟢 KnowledgeBlock review queue smoke test passed")
PY
echo "🟢 KnowledgeBlock review queue verified"
