#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Guided Knowledge Orchestration Kernel"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in   docs/signals/SAKANA_RL_CONDUCTOR_SIGNAL.md   docs/conductor/ANDYAI_CONDUCTOR_LAYER_STANDARD.md   docs/conductor/DYNAMIC_RETRIEVAL_STRATEGY_PLANNER.md   docs/conductor/AGENT_ROLE_ASSIGNMENT_FOR_KNOWLEDGE_FACTORY.md   docs/conductor/policies/CONTEXT_ACCESS_POLICY_FOR_RETRIEVAL_WORKERS.md   docs/conductor/VERIFIER_CRITIC_LAYER_FOR_KNOWLEDGE_ANSWERS.md   docs/conductor/policies/HUMAN_APPROVAL_GATE_FOR_CONDUCTOR_DECISIONS.md   docs/conductor/RETRY_STRATEGY_ENGINE_FOR_FAILED_KNOWLEDGE_WORKFLOWS.md   docs/conductor/CONDUCTOR_EVIDENCE_LOG.md   docs/conductor/GUIDED_KNOWLEDGE_ORCHESTRATION_KERNEL.md   docs/conductor/V55_CANON_LOCK.md   docs/conductor/V55_NEXT_MASTER_PLAN.md   schemas/conductor-plan.schema.json   schemas/retrieval-strategy.schema.json   schemas/worker-assignment.schema.json   schemas/context-access-policy.schema.json   schemas/conductor-evidence-log.schema.json   examples/conductor/conductor-plan-demo.json   examples/conductor/guided-knowledge-orchestration-demo.json   scripts/print_conductor_status.sh   scripts/print_v55_guided_orchestration_kernel.sh   apps/knowledgefactory-web/app/conductor/page.tsx   apps/knowledgefactory-web/app/api/conductor/status/route.ts   apps/knowledgefactory-web/app/conductor-demo/page.tsx   apps/knowledgefactory-web/app/api/conductor-demo/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
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

assert sakana_signal_status()["relevance"] == "highest"
assert conductor_plan("explain source freshness")["status"] == "planned"
assert choose_retrieval_strategy("graph and source freshness")["strategy"] == "graph_plus_source_freshness"
assert assign_worker_role("verify")["role"] == "verifier"
assert context_access_policy("retrieval_worker")["access"] == "limited"
assert verify_knowledge_answer("answer", ["source"])["status"] == "verified"
assert conductor_human_approval_gate(True)["approval_required"] is True
assert retry_strategy("missing_evidence")["retry"] is True
assert conductor_evidence_log("plan_created")["event_type"] == "plan_created"
assert guided_knowledge_orchestration_status()["version"] == "v55.0.0"
print("🟢 Conductor Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
