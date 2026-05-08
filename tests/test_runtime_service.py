from rag_ingestion_factory.runtime.service import RuntimeService

def test_runtime_service_health():
    svc = RuntimeService()
    assert svc.health()["status"] == "ok"
