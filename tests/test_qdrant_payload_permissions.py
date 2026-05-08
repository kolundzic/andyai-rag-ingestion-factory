from rag_ingestion_factory.security.access_policy import AccessPolicy, PermissionContext
from rag_ingestion_factory.security.qdrant_payload_filter import build_qdrant_permission_filter_payload
from rag_ingestion_factory.indexes.qdrant_payload import build_qdrant_chunk_payload

def test_qdrant_permission_filter_payload():
    context = PermissionContext("u1", "t1", ("reader",), "internal")
    payload = build_qdrant_permission_filter_payload(context)
    assert payload["must"][0]["key"] == "tenant_id"

def test_qdrant_chunk_payload():
    policy = AccessPolicy("t1", "internal", ("reader",), ("u1",))
    payload = build_qdrant_chunk_payload({"chunk_id": "chk_1"}, policy)
    assert payload["tenant_id"] == "t1"
    assert "reader" in payload["allowed_roles"]
