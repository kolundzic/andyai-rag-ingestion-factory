from rag_ingestion_factory.wikipress import wikipress_offer_status


def test_wikipress_offer_status():
    status = wikipress_offer_status()
    assert status["version"] == "v26.1.0"
    assert "Enterprise" in status["tiers"]
