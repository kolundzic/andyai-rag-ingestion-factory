#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Curator Persistence + Operator Command System"
echo "━━━━━━━━━━━━━━━━━━━━"

test -f supabase/migrations/20260509_321_curator_persistence.sql
test -f docs/109-curator-persistence/SUPABASE_CURATOR_PERSISTENCE_SCHEMA.md
test -f docs/109-curator-persistence/CURATOR_QUEUE_RUNTIME_MODEL.md
test -f docs/109-curator-persistence/CURATOR_ACTION_API_SCAFFOLD.md
test -f docs/110-curator-review/HUMAN_REVIEW_GATE_FOR_CURATOR_ACTIONS.md
test -f docs/110-curator-review/CURATOR_EVIDENCE_TRAIL.md
test -f docs/111-curator-command-center/CURATOR_OPERATOR_COMMAND_CENTER.md
test -f docs/111-curator-command-center/CURATOR_HEALTH_SCORE.md
test -f docs/112-scheduled-hygiene/SCHEDULED_HYGIENE_RUNNER.md
test -f docs/113-curator-report-export/CURATOR_REPORT_EXPORT_PACK.md
test -f docs/114-curator-production-demo/KNOWLEDGE_CURATOR_PRODUCTION_DEMO_KERNEL.md

test -f apps/knowledgefactory-web/app/curator-operator/page.tsx
test -f apps/knowledgefactory-web/app/api/curator-operator/status/route.ts
test -f apps/knowledgefactory-web/app/curator-demo/page.tsx
test -f apps/knowledgefactory-web/app/api/curator-demo/status/route.ts
test -f apps/knowledgefactory-web/app/api/curator-actions/create/route.ts
test -f apps/knowledgefactory-web/app/api/curator-actions/list/route.ts
test -f apps/knowledgefactory-web/app/api/curator-actions/review/route.ts

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.curator.persistence import curator_persistence_status
from rag_ingestion_factory.curator.queue import curator_queue_statuses
from rag_ingestion_factory.curator.actions import curator_action_types
from rag_ingestion_factory.curator.review_gate import review_gate_decision
from rag_ingestion_factory.curator.evidence_trail import curator_evidence_trail
from rag_ingestion_factory.curator.health_score import curator_health_score
from rag_ingestion_factory.curator.scheduler import scheduled_hygiene_run
from rag_ingestion_factory.curator.export_pack import curator_export_pack
from rag_ingestion_factory.curator.production_demo import curator_production_demo_status

assert "curator_tasks" in curator_persistence_status()["tables"]
assert "verified" in curator_queue_statuses()
assert "attach_evidence" in curator_action_types()
assert review_gate_decision({"action_type":"verify_fix"}, "approved")["canonical_allowed"] is True
assert curator_evidence_trail("s","r",{}, {})["approval"] == "pending"
assert curator_health_score(100,0,100,100,0,100,0)["status"] == "green"
assert scheduled_hygiene_run("manual_operator_scan")["status"] == "scheduled"
assert curator_export_pack("report-demo")["status"] == "ready_for_export"
assert curator_production_demo_status()["version"] == "v35.0.0"
print("🟢 Python curator smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
