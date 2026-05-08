#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_wiki_bridge.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.graph.graph_bridge import graph_from_blocks
assert graph_from_blocks([{"id":"kb"}])["nodes"]
print("🟢 Graph bridge smoke test passed")
PY
echo "🟢 KnowledgeBlock to Knowledge Graph bridge verified"
