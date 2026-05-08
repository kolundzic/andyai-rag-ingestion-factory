#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v15.0.0 — Knowledge Workflows & Agentic Compilation"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.workflows.status import build_v15_workflow_status
from rag_ingestion_factory.workflows.engine import build_wiki_compile_workflow, create_review_item_for_workflow, create_export_bundle
from rag_ingestion_factory.agents.agentic_compiler import build_agentic_compiler_task, FORBIDDEN_COMPILER_ACTIONS

status = build_v15_workflow_status()
workflow = build_wiki_compile_workflow("evpack_demo_001")
review = create_review_item_for_workflow(workflow, "wiki_page", "wiki_permission_aware_retrieval")
export = create_export_bundle(review)
task = build_agentic_compiler_task("task_demo_001")

assert status["site"] == "knowledgefactory.andyai.ai"
assert "approve" in status["workflow"]
assert workflow.status == "waiting_for_review"
assert review.status == "pending"
assert export.evidence_refs == ("evpack_demo_001",)
assert task.requires_human_approval
assert "bypass_permissions" in FORBIDDEN_COMPILER_ACTIONS

print("🟢 v15 status verified")
print("🟢 workflow engine verified")
print("🟢 agentic compiler contract verified")
PY

test -f docs/57-knowledge-workflows/V15_KNOWLEDGE_WORKFLOWS_AGENTIC_COMPILATION.md
test -f docs/57-knowledge-workflows/KNOWLEDGE_WORKFLOW_ENGINE.md
test -f docs/57-knowledge-workflows/AGENTIC_COMPILER_CONTRACT.md
test -f docs/57-knowledge-workflows/REVIEW_QUEUE_STANDARD.md
test -f docs/57-knowledge-workflows/EXPORT_BUNDLE_STANDARD.md
test -f docs/57-knowledge-workflows/REUSE_POLICY.md
test -f docs/57-knowledge-workflows/WORKFLOW_AGENT_MAP.md
test -f docs/releases/RELEASE_NOTES_v15.0.0.md
test -f schemas/workflow-step.schema.json
test -f schemas/workflow-run.schema.json
test -f schemas/review-item.schema.json
test -f schemas/export-bundle.schema.json
test -f schemas/agentic-compiler-task.schema.json
test -f examples/knowledge-workflows/sample-workflow-run.json
test -f examples/knowledge-workflows/sample-review-item.json
test -f examples/knowledge-workflows/sample-export-bundle.json
test -f src/rag_ingestion_factory/workflows/models.py
test -f src/rag_ingestion_factory/workflows/engine.py
test -f src/rag_ingestion_factory/workflows/status.py
test -f src/rag_ingestion_factory/agents/agentic_compiler.py
test -f apps/knowledgefactory-web/app/workflows/page.tsx
test -f apps/knowledgefactory-web/app/agentic-compiler/page.tsx
test -f apps/knowledgefactory-web/app/api/workflows/demo/route.ts
test -f apps/knowledgefactory-web/app/api/agentic-compiler/demo/route.ts
test -f scripts/print_v15_workflow_status.sh
test -f scripts/generate_v15_sample_workflow.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
