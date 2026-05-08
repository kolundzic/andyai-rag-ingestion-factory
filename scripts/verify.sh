#!/usr/bin/env bash
set -euo pipefail

python3 -m compileall src >/dev/null
python3 - <<'PY'
from rag_ingestion_factory.chunking import simple_page_chunk
c = simple_page_chunk("doc_demo", "Hello RAG factory", 1, "Demo")
assert c.chunk_id.startswith("chk_")
print("🟢 Python package smoke test passed")
PY

test -f README.md
test -f docs/00-canon/CANON_LOCK.md
test -f docs/01-architecture/ARCHITECTURE.md
test -f schemas/document.schema.json
test -f schemas/chunk.schema.json

echo "🟢 Repository verification passed"
