from rag_ingestion_factory.knowledge_graph.models import KnowledgeNode, KnowledgeEdge, Claim

def test_knowledge_node_to_dict():
    node = KnowledgeNode("n1", "topic", "Topic")
    assert node.to_dict()["node_id"] == "n1"

def test_knowledge_edge_to_dict():
    edge = KnowledgeEdge("e1", "n1", "n2", "supports", 0.9)
    assert edge.to_dict()["edge_type"] == "supports"

def test_claim_to_dict():
    claim = Claim("c1", "A claim.")
    assert claim.to_dict()["text"] == "A claim."
