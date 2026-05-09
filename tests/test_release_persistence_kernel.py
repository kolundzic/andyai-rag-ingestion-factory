from rag_ingestion_factory.release.persistence import release_evidence_record, release_history_query
from rag_ingestion_factory.release.health_rollup import release_health_rollup
from rag_ingestion_factory.release.timeline import release_timeline
from rag_ingestion_factory.release.incident_memory import release_incident_memory
from rag_ingestion_factory.release.evidence_store import evidence_store_status
from rag_ingestion_factory.release.live_dashboard import live_release_dashboard_status
from rag_ingestion_factory.release.public_proof import persisted_public_release_proof
from rag_ingestion_factory.release.release_memory_kernel import release_memory_kernel_status

def test_release_persistence_kernel():
    assert release_evidence_record("v50.0.0", "v45.0.0", "green")["status"] == "record_ready"
    assert release_history_query(limit=5)["limit"] == 5
    assert release_health_rollup(["green", "yellow"])["status"] == "yellow"
    assert release_timeline(["v45.0.0", "v50.0.0"])["count"] == 2
    assert release_incident_memory([])["policy"] == "forward_only"
    assert evidence_store_status()["status"] == "store_ready"
    assert live_release_dashboard_status()["status"] == "live_dashboard_ready"
    assert persisted_public_release_proof("v50.0.0")["status"] == "persisted_proof_ready"
    assert release_memory_kernel_status()["version"] == "v50.0.0"
