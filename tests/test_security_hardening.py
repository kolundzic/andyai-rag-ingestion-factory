from rag_ingestion_factory.runtime.security_hardening import score_security_readiness


def test_score_security_readiness():
    assert score_security_readiness(["tenant-bound RLS"])["score"] == 20
