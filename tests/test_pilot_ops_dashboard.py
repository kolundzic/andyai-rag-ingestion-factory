from rag_ingestion_factory.runtime.pilot_ops_dashboard import build_ops_dashboard


def test_build_ops_dashboard():
    assert build_ops_dashboard()["total_requests"] == 3
