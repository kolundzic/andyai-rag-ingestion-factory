from rag_ingestion_factory.curator import hermes_signal_status
from rag_ingestion_factory.curator.knowledge_curator import knowledge_curator_status, build_curator_report
from rag_ingestion_factory.curator.chunk_curator import chunk_noise_map, classify_chunk_noise
from rag_ingestion_factory.curator.source_freshness import source_freshness_score
from rag_ingestion_factory.curator.duplicate_detector import detect_duplicate_pair
from rag_ingestion_factory.curator.graph_hygiene import graph_hygiene_report
from rag_ingestion_factory.curator.evidence_quality import evidence_quality_score
from rag_ingestion_factory.curator.stale_report import stale_knowledge_report
from rag_ingestion_factory.guided_action import claude_signal_status, guided_knowledge_action, curator_guided_action_launch_status
from rag_ingestion_factory.guided_action.ecosystem import ecosystem_signal_map


def test_curator_arc_smoke():
    assert "Knowledge Factory cleans knowledge" in hermes_signal_status()["canon"]
    assert "duplicates" in knowledge_curator_status()["checks"]
    assert build_curator_report("x", "duplicate")["suggested_action"] == "route_to_review"
    assert "missing_source" in chunk_noise_map()["noise_types"]
    assert "missing_source" in classify_chunk_noise({"text": "", "source_id": None})
    assert source_freshness_score(500, has_newer_version=True)["status"] == "stale"
    assert detect_duplicate_pair("a", "a")["is_duplicate"] is True
    assert "a" in graph_hygiene_report([{"id": "a"}], [])["orphan_nodes"]
    assert evidence_quality_score(True, True, 1, 1, 1, True, 0)["status"] == "strong"
    assert stale_knowledge_report("kb1", "old", dependencies=["x"])["human_review_priority"] == "high"
    assert "Guided Action" in claude_signal_status()["andyai_translation"]
    assert guided_knowledge_action("fix")["human_approval"] == "pending"
    assert "Knowledge Factory" in ecosystem_signal_map()["projects"]
    assert curator_guided_action_launch_status()["version"] == "v32.0.0"
