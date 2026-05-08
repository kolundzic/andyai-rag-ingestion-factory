from rag_ingestion_factory.observability.dashboard import build_observability_snapshot

def test_observability_snapshot():
    snap = build_observability_snapshot([{"status": "ok"}])
    assert snap["health"] == "green"
