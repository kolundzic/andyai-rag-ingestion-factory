from rag_ingestion_factory.curator.persistence import curator_persistence_status
from rag_ingestion_factory.curator.queue import curator_queue_statuses, create_queue_item, transition_queue_item
from rag_ingestion_factory.curator.actions import curator_action_types, create_curator_action
from rag_ingestion_factory.curator.review_gate import review_gate_decision
from rag_ingestion_factory.curator.evidence_trail import curator_evidence_trail
from rag_ingestion_factory.curator.health_score import curator_health_score
from rag_ingestion_factory.curator.scheduler import scheduled_hygiene_run
from rag_ingestion_factory.curator.export_pack import curator_export_pack
from rag_ingestion_factory.curator.production_demo import curator_production_demo_status


def test_curator_v35_kernel():
    assert "curator_tasks" in curator_persistence_status()["tables"]
    assert "verified" in curator_queue_statuses()
    assert transition_queue_item(create_queue_item("freshness", "s1"), "triaged")["status"] == "triaged"
    assert "attach_evidence" in curator_action_types()
    assert create_curator_action("verify_fix", "kb1")["status"] == "planned"
    assert review_gate_decision({"action_type": "verify_fix"}, "approved")["canonical_allowed"] is True
    assert curator_evidence_trail("s", "r", {}, {})["approval"] == "pending"
    assert curator_health_score(100, 0, 100, 100, 0, 100, 0)["status"] == "green"
    assert scheduled_hygiene_run("manual_operator_scan")["status"] == "scheduled"
    assert curator_export_pack("r1")["status"] == "ready_for_export"
    assert curator_production_demo_status()["version"] == "v35.0.0"
