from rag_ingestion_factory.knowledge_graph.compiler import build_claim_node_from_evidence_pack, link_topic_to_claim

def test_build_claim_node_from_evidence_pack():
    pack = {"citations": [{"chunk_id": "chunk_1"}], "evidence_pack_id": "ev1"}
    node, claim = build_claim_node_from_evidence_pack(pack, "Permissions shape retrieval.")
    assert node.node_type == "claim"
    assert claim.approval_status == "supported"

def test_link_topic_to_claim():
    edge = link_topic_to_claim("topic_1", "claim_1")
    assert edge.edge_type == "supports"
