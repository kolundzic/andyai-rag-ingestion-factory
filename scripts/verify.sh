#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 AndyAI RAG Ingestion Factory VERIFY"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)

assert manifest["status"] == "completed"
assert manifest["chunks_count"] >= 1
assert (out / "chunks.jsonl").exists()
assert (out / "manifest.json").exists()
assert (out / "keyword_index.json").exists()

print("🟢 Local ingestion MVP smoke test passed")
print(f"🟢 Chunks created: {manifest['chunks_count']}")
PY

test -f README.md
test -f docs/09-visual/ANDYAI_VISUAL_CANON.md
test -f docs/diagrams/README_VISUALS.md
test -f assets/visual/README_ICON_LEGEND.md
test -f src/rag_ingestion_factory/core/pipeline_v1.py
test -f src/rag_ingestion_factory/core/__init__.py

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
