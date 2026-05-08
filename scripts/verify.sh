#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v16.3.0 — Self-Hosted Retrieval Lab Signal"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY4'
from rag_ingestion_factory.retrieval_lab.status import build_v16_3_retrieval_lab_status
from rag_ingestion_factory.retrieval_lab.policies import strict_context_answer

status = build_v16_3_retrieval_lab_status()
assert status["site"] == "knowledgefactory.andyai.ai"
assert any(a["backend"] == "turbovec" for a in status["adapters"])
assert strict_context_answer("", "x")["answer"] == "Not found in context."
print("🟢 retrieval lab status verified")
print("🟢 strict context answering verified")
PY4

for f in \
docs/signals/DEEPSEEK_V4_TURBOVEC_RAG_SIGNAL.md \
docs/61-self-hosted-retrieval-lab/SELF_HOSTED_RETRIEVAL_LAB.md \
docs/61-self-hosted-retrieval-lab/architecture/VECTOR_LAYER_ADAPTER_STANDARD.md \
docs/61-self-hosted-retrieval-lab/policies/STRICT_CONTEXT_ANSWERING_POLICY.md \
docs/61-self-hosted-retrieval-lab/policies/EVIDENCE_FIRST_RETRIEVAL_STANDARD.md \
docs/61-self-hosted-retrieval-lab/specs/LOCAL_OCR_RAG_PIPELINE_SPEC.md \
docs/61-self-hosted-retrieval-lab/compare/RAG_RETRIEVAL_VS_KNOWLEDGE_FACTORY.md \
docs/61-self-hosted-retrieval-lab/TURBOVEC_ADAPTER_CANDIDATE_NOTE.md \
docs/releases/RELEASE_NOTES_v16.3.0.md \
schemas/vector-adapter.schema.json \
schemas/retrieval-lab-run.schema.json \
examples/self-hosted-retrieval-lab/sample-vector-adapter-registry.json \
examples/self-hosted-retrieval-lab/sample-strict-context-response.json \
src/rag_ingestion_factory/retrieval_lab/models.py \
src/rag_ingestion_factory/retrieval_lab/policies.py \
src/rag_ingestion_factory/retrieval_lab/status.py \
apps/knowledgefactory-web/app/self-hosted-retrieval/page.tsx \
apps/knowledgefactory-web/app/vector-adapters/page.tsx \
apps/knowledgefactory-web/app/api/self-hosted-retrieval/demo/route.ts \
apps/knowledgefactory-web/lib/selfHostedRetrieval.ts \
scripts/print_v16_3_retrieval_lab_status.sh; do test -f "$f"; done

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
