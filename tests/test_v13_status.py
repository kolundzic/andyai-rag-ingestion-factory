from rag_ingestion_factory.knowledge_graph.status import build_v13_knowledge_graph_status

def test_v13_status():
    status = build_v13_knowledge_graph_status()
    assert status["site"] == "knowledgefactory.andyai.ai"
    assert status["formula"]["RAG"] == "Retrieval Layer"
