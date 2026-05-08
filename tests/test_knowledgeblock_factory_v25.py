from rag_ingestion_factory.knowledgeblock_factory import knowledgeblock_factory_status


def test_knowledgeblock_factory_status():
    status = knowledgeblock_factory_status()
    assert status["version"] == "v25.0.0"
    assert status["score"] >= 80
