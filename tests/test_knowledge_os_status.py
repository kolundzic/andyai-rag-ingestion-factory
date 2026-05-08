from rag_ingestion_factory.knowledge_os.status import build_knowledge_os_status

def test_knowledge_os_status():
    status = build_knowledge_os_status()
    assert status["repo"] == "andyai-rag-ingestion-factory"
    assert "ingestion" in status["core_layers"]
