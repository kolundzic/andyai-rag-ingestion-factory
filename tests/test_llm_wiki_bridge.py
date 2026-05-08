from rag_ingestion_factory.wiki_bridge import karpathy_bridge_status
from rag_ingestion_factory.wiki_bridge.adastranova_map import adastranova_integration_map
from rag_ingestion_factory.wiki_bridge.context_farmer import context_farmer_cycle


def test_karpathy_bridge_status():
    status = karpathy_bridge_status()
    assert status["version"] == "v25.2.0"
    assert "wiki" in status["layers"]


def test_adastranova_map():
    assert adastranova_integration_map()["implementation"] == "BEYOND"


def test_context_farmer_cycle():
    assert "lint_health_check" in context_farmer_cycle()
