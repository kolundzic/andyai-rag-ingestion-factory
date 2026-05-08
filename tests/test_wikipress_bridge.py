from rag_ingestion_factory.wiki_bridge.wikipress_bridge import wikipress_bridge_status


def test_wikipress_bridge_status():
    status = wikipress_bridge_status()
    assert status["version"] == "v26.0.0"
    assert status["product"] == "AndyAI WikiPress"
