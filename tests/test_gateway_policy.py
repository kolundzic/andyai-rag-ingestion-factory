from rag_ingestion_factory.gateway.policy import ExternalGatewayPolicy, can_externalize_evidence_pack

def test_gateway_policy_allows_cited_pack():
    pack = {"citations": [{"chunk_id": "c"}]}
    decision = can_externalize_evidence_pack(pack, ExternalGatewayPolicy())
    assert decision.allowed
