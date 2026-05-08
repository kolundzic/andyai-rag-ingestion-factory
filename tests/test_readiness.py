from rag_ingestion_factory.operator.readiness import ReadinessCheck, calculate_readiness_score

def test_calculate_readiness_score():
    checks = [
        ReadinessCheck("a", True, 50, "ok"),
        ReadinessCheck("b", False, 50, "no"),
    ]
    result = calculate_readiness_score(checks)
    assert result["score"] == 50.0
    assert result["level"] == "prototype-ready"
