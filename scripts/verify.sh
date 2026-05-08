#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v3.0.0 — Production Bridge"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file
from rag_ingestion_factory.core.registry import register_document
from rag_ingestion_factory.adapters.router import parse_document
from rag_ingestion_factory.core.chunker import chunk_page_blocks
from rag_ingestion_factory.embeddings.local import LocalDeterministicEmbeddingProvider
from rag_ingestion_factory.indexes.memory_vector_index import MemoryVectorIndex
from rag_ingestion_factory.retrieval.hybrid import HybridRetriever
from rag_ingestion_factory.evidence.pack import build_evidence_pack
from rag_ingestion_factory.governance.audit import GovernanceAuditLog
from rag_ingestion_factory.config.settings import load_settings
from rag_ingestion_factory.jobs.batch_ingest import batch_ingest

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)
assert manifest["status"] == "completed"

doc = register_document("examples/sample_documents/demo_document.txt")
pages = parse_document(doc)
chunks = chunk_page_blocks(pages)

settings = load_settings()
embedder = LocalDeterministicEmbeddingProvider(dimensions=settings.embedding_dimensions)
idx = MemoryVectorIndex()
for c in chunks:
    idx.upsert_chunk(c, embedder.embed(c.text))

results = HybridRetriever(chunks, idx).search("What does the ingestion pipeline prepare?", limit=3)
pack = build_evidence_pack("What does the ingestion pipeline prepare?", results)
assert pack["citations"]

batch_dir = Path("examples/batch_input")
batch_dir.mkdir(parents=True, exist_ok=True)
(batch_dir / "demo_batch.txt").write_text("Page 1\nBatch ingestion bridge works.", encoding="utf-8")
batch_manifests = batch_ingest(batch_dir, "examples/output/batch_verify")
assert batch_manifests

audit = GovernanceAuditLog()
audit.record("verify", "passed", {"results": len(results), "citations": len(pack["citations"]), "batch": len(batch_manifests)})
assert audit.summary()["events"] == 1
assert audit.summary()["failures"] == 0

print("🟢 v3 production bridge smoke test passed")
PY

python3 - <<'PY'
import rag_ingestion_factory.api.app as app_module
assert hasattr(app_module, "IngestTextDemoRequest")
assert hasattr(app_module, "RetrieveDemoRequest")
print("🟢 API foundation import passed")
PY

test -f docker-compose.yml
test -f docker/.env.example
test -f docs/17-production/PRODUCTION_BRIDGE_v3_0.md
test -f docs/17-production/DOCKER_STACK_v3_0.md
test -f docs/18-api/API_FOUNDATION_v3_0.md
test -f docs/19-operator/OPERATOR_QUICKSTART_v3_0.md
test -f docs/releases/RELEASE_NOTES_v3.0.0.md
test -f src/rag_ingestion_factory/config/settings.py
test -f src/rag_ingestion_factory/embeddings/local.py
test -f src/rag_ingestion_factory/jobs/batch_ingest.py
test -f src/rag_ingestion_factory/api/app.py

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
