from rag_ingestion_factory.conductor.signal import sakana_signal_status
from rag_ingestion_factory.conductor.planner import conductor_plan
from rag_ingestion_factory.conductor.retrieval_strategy import choose_retrieval_strategy
from rag_ingestion_factory.conductor.worker_assignment import assign_worker_role
from rag_ingestion_factory.conductor.context_policy import context_access_policy
from rag_ingestion_factory.conductor.verifier import verify_knowledge_answer
from rag_ingestion_factory.conductor.approval_gate import conductor_human_approval_gate
from rag_ingestion_factory.conductor.retry_strategy import retry_strategy
from rag_ingestion_factory.conductor.evidence_log import conductor_evidence_log
from rag_ingestion_factory.conductor.kernel import guided_knowledge_orchestration_status

def test_conductor_kernel():
    assert sakana_signal_status()["relevance"] == "highest"
    assert conductor_plan("question")["status"] == "planned"
    assert choose_retrieval_strategy("graph freshness")["strategy"] == "graph_plus_source_freshness"
    assert assign_worker_role("verify answer")["role"] == "verifier"
    assert context_access_policy("retrieval_worker")["access"] == "limited"
    assert verify_knowledge_answer("answer", ["source"])["status"] == "verified"
    assert conductor_human_approval_gate(True)["approval_required"] is True
    assert retry_strategy("missing_evidence")["retry"] is True
    assert conductor_evidence_log("plan_created")["status"] == "logged"
    assert guided_knowledge_orchestration_status()["version"] == "v55.0.0"
