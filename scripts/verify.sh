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
assert manifest["pipeline_version"] == "1.2.0"
assert (out / "chunks.jsonl").exists()
assert (out / "manifest.json").exists()
assert (out / "keyword_index.json").exists()

print("🟢 Local text ingestion smoke test passed")
print(f"🟢 Chunks created: {manifest['chunks_count']}")
PY

python3 - <<'PY'
from rag_ingestion_factory.adapters.pdf_parser import PdfParserDependencyError
print("🟢 PDF parser adapter import passed")
print("🟢 PDF dependency is optional; install with: python3 -m pip install pymupdf")
PY

test -f src/rag_ingestion_factory/adapters/pdf_parser.py
test -f src/rag_ingestion_factory/adapters/router.py
test -f docs/10-parser/PDF_PARSER_ADAPTER_v1_2.md
test -f docs/02-ingestion/PDF_INGESTION_STANDARD_v1_2.md

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
