from rag_ingestion_factory.indexes.qdrant_permission_demo import build_live_qdrant_permission_demo

def test_live_qdrant_permission_demo():
    demo = build_live_qdrant_permission_demo()
    assert demo["filter_payload"]["must"]
    assert demo["chunk_payload"]["tenant_id"] == "default"
