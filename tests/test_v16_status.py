from rag_ingestion_factory.control_tower.status import build_v16_control_tower_status

def test_v16_control_tower_status():
    status = build_v16_control_tower_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert status["readiness"]["blocking_failures"] == 0
