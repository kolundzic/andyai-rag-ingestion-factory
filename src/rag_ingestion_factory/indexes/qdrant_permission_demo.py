from __future__ import annotations

from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext
from rag_ingestion_factory.security.qdrant_payload_filter import build_qdrant_permission_filter_payload
from rag_ingestion_factory.indexes.qdrant_payload import build_qdrant_chunk_payload


def build_live_qdrant_permission_demo() -> dict:
    context = PermissionContext(user_id="demo-user", tenant_id="default", roles=("reader",), clearance_level="internal")
    policy = AccessPolicy(tenant_id="default", classification="internal", allowed_roles=("reader",), allowed_users=("demo-user",))
    filter_payload = build_qdrant_permission_filter_payload(context)
    chunk_payload = build_qdrant_chunk_payload({"chunk_id": "chk_demo", "document_id": "doc_demo"}, policy)
    return {
        "mode": "qdrant-permission-demo",
        "filter_payload": filter_payload,
        "chunk_payload": chunk_payload,
        "rule": "Permissions must shape vector retrieval before context reaches the model.",
    }
