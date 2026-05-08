from rag_ingestion_factory.retrieval_lab.status import build_v16_3_retrieval_lab_status

def test_v16_3_retrieval_lab_status():
    status = build_v16_3_retrieval_lab_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert any(a["backend"] == "turbovec" for a in status["adapters"])
