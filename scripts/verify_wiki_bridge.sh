#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_clean_vector_surface.sh
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wiki.knowledgeblock_compiler import compile_topic_page
assert "# Topic" in compile_topic_page("Topic", [])
print("🟢 Wiki bridge smoke test passed")
PY
echo "🟢 KnowledgeBlock to LLM Wiki bridge verified"
