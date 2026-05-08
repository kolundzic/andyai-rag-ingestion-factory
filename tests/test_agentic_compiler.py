from rag_ingestion_factory.agents.agentic_compiler import build_agentic_compiler_task, FORBIDDEN_COMPILER_ACTIONS

def test_agentic_compiler_task():
    task = build_agentic_compiler_task("task1")
    assert task.requires_human_approval
    assert task.evidence_required
    assert "bypass_permissions" in FORBIDDEN_COMPILER_ACTIONS
