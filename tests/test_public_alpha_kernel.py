from rag_ingestion_factory.conductor.event_store import conductor_event_record
from rag_ingestion_factory.conductor.worker_contracts import worker_execution_contract, worker_result_envelope
from rag_ingestion_factory.conductor.strategy_simulator import retrieval_strategy_simulation
from rag_ingestion_factory.conductor.live_dashboard import conductor_live_dashboard_status
from rag_ingestion_factory.conductor.approval_console import approval_console_status, retry_console_status
from rag_ingestion_factory.conductor.production_readiness import conductor_production_readiness_status
from rag_ingestion_factory.public_launch.positioning import public_product_positioning
from rag_ingestion_factory.public_launch.route_map import public_route_map
from rag_ingestion_factory.public_launch.feedback import public_feedback_record
from rag_ingestion_factory.public_launch.alpha_kernel import public_alpha_launch_status

def test_public_alpha_kernel():
    assert conductor_event_record("plan_created")["status"] == "event_ready"
    assert worker_execution_contract("retrieval_worker")["status"] == "contract_ready"
    assert worker_result_envelope("success")["status"] == "success"
    assert retrieval_strategy_simulation("graph freshness")["strategy"] == "graph_plus_source_freshness"
    assert conductor_live_dashboard_status()["status"] == "live_conductor_dashboard_ready"
    assert approval_console_status()["status"] == "approval_console_ready"
    assert retry_console_status()["status"] == "retry_console_ready"
    assert conductor_production_readiness_status()["version"] == "v60.0.0"
    assert public_product_positioning()["status"] == "positioning_ready"
    assert "/public-alpha" in public_route_map()["routes"]
    assert public_feedback_record("interested")["status"] == "captured"
    assert public_alpha_launch_status()["version"] == "v70.0.0"
