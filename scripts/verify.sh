#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.2.0 — Qdrant Payload Permission Filters"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext
from rag_ingestion_factory.security.qdrant_payload_filter import build_qdrant_permission_filter_payload
from rag_ingestion_factory.indexes.qdrant_payload import build_qdrant_chunk_payload

policy = AccessPolicy(tenant_id="tenant-a", classification="internal", allowed_roles=("reader",), allowed_users=("u1",))
context = PermissionContext(user_id="u1", tenant_id="tenant-a", roles=("reader",), clearance_level="internal")

payload_filter = build_qdrant_permission_filter_payload(context)
assert payload_filter["must"]
assert any(item["key"] == "tenant_id" for item in payload_filter["must"])

payload = build_qdrant_chunk_payload(
    chunk_payload={"chunk_id": "chk_1", "document_id": "doc_1", "file_name": "demo.txt", "page_start": 1, "page_end": 1},
    policy=policy,
)
assert payload["tenant_id"] == "tenant-a"
assert payload["classification"] == "internal"
assert "reader" in payload["allowed_roles"]
print("🟢 Qdrant payload permission filter smoke test passed")
PY

test -f docs/28-qdrant-permissions/QDRANT_PAYLOAD_PERMISSION_FILTERS_v4_2.md
test -f src/rag_ingestion_factory/security/qdrant_payload_filter.py
test -f src/rag_ingestion_factory/indexes/qdrant_payload.py

echo "🟢 VERIFY PASSED"
