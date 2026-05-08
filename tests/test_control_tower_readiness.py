from rag_ingestion_factory.control_tower.readiness import build_default_v16_checks, calculate_deploy_readiness

def test_calculate_deploy_readiness():
    checks = build_default_v16_checks()
    result = calculate_deploy_readiness(checks)
    assert result["level"] in {"deploy-candidate", "production-ready"}
    assert result["blocking_failures"] == 0
