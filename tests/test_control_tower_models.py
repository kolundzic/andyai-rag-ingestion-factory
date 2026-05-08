from rag_ingestion_factory.control_tower.models import DeployReadinessCheck, DeployGate, ProductionProofBundle

def test_control_tower_models_to_dict():
    check = DeployReadinessCheck("c1", "repo", "pass", True, "ok")
    gate = DeployGate("g1", "Repo Gate", "passed", (check,))
    bundle = ProductionProofBundle("v16.0.0", "knowledgefactory.andyai.ai", (check,), "git checkout v15.0.0")
    assert check.to_dict()["status"] == "pass"
    assert gate.to_dict()["gate_id"] == "g1"
    assert bundle.to_dict()["product_site"] == "knowledgefactory.andyai.ai"
