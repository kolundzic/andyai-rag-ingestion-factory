from rag_ingestion_factory.workflows.status import build_v15_workflow_status

def test_v15_workflow_status():
    status = build_v15_workflow_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert "approve" in status["workflow"]
