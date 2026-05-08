#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v5.0.0 — Sovereign Enterprise RAG Factory"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.factory.sovereign_status import build_sovereign_factory_status
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext
from rag_ingestion_factory.security.qdrant_payload_filter import build_qdrant_permission_filter_payload
from rag_ingestion_factory.gateway.policy import ExternalGatewayPolicy, can_externalize_evidence_pack
from rag_ingestion_factory.drafting.templates import render_template_draft
from rag_ingestion_factory.context_board.board import context_board_from_evidence_pack

status = build_sovereign_factory_status()
assert status["version"] == "5.0.0"
assert status["factory_level"] == "sovereign-enterprise-rag-factory"

context = PermissionContext(user_id="u1", tenant_id="default", roles=("reader",), clearance_level="internal")
flt = build_qdrant_permission_filter_payload(context)
assert flt["must"]

pack = {
    "query": "demo",
    "answer_context": "Evidence-backed context.",
    "citations": [{"chunk_id": "chk_1", "file_name": "demo.txt", "page_start": 1, "page_end": 1, "section_title": "Demo"}],
    "evidence_policy": "No citation pack, no trusted answer."
}
board = context_board_from_evidence_pack(pack)
assert board.evidence_items

draft = render_template_draft(pack, "technical_summary")
assert "Technical Summary" in draft

gateway = can_externalize_evidence_pack(pack, ExternalGatewayPolicy())
assert gateway.allowed

print("🟢 Sovereign Enterprise RAG Factory smoke test passed")
PY

test -f docs/32-sovereign-factory/SOVEREIGN_ENTERPRISE_RAG_FACTORY_v5_0.md
test -f docs/releases/RELEASE_NOTES_v5.0.0.md
test -f src/rag_ingestion_factory/factory/sovereign_status.py
test -f scripts/print_v5_status.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
