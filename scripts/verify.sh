#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Public Product Opening + Vercel Launch Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  docs/conductor/persistence/CONDUCTOR_EVENT_STORE_MODEL.md \
  docs/conductor/persistence/SUPABASE_CONDUCTOR_EVENT_PERSISTENCE.md \
  docs/conductor/contracts/WORKER_EXECUTION_CONTRACT_STANDARD.md \
  docs/conductor/contracts/WORKER_RESULT_ENVELOPE_SCHEMA.md \
  docs/conductor/simulator/RETRIEVAL_STRATEGY_SIMULATOR.md \
  docs/conductor/simulator/GUIDED_KNOWLEDGE_WORKFLOW_DEMO.md \
  docs/conductor/dashboard/LIVE_CONDUCTOR_DASHBOARD.md \
  docs/conductor/dashboard/CONDUCTOR_TIMELINE_VIEW.md \
  docs/conductor/approval/HUMAN_APPROVAL_CONSOLE_FOR_KNOWLEDGE_WORKFLOWS.md \
  docs/conductor/approval/RETRY_STRATEGY_CONSOLE.md \
  docs/conductor/CONDUCTOR_PRODUCTION_READINESS_KERNEL.md \
  docs/public-launch/PUBLIC_PRODUCT_POSITIONING_LAYER.md \
  docs/public-launch/PUBLIC_LANDING_PAGE_COPY_BANK.md \
  docs/public-site/VERCEL_PUBLIC_DEMO_ROUTE_MAP.md \
  docs/public-site/PUBLIC_DEMO_NAVIGATION_SHELL.md \
  docs/public-site/KNOWLEDGE_FACTORY_PUBLIC_SHOWCASE_PAGE.md \
  docs/public-site/CONDUCTOR_PUBLIC_EXPLAINER_PAGE.md \
  docs/public-site/VISUAL_ATLAS_PUBLIC_GALLERY_LINKAGE.md \
  docs/public-trust/RELEASE_PROOF_PUBLIC_TRUST_PAGE_LINKAGE.md \
  docs/public-launch/PILOT_REQUEST_CTA_INTEGRATION.md \
  docs/public-launch/PUBLIC_INTEREST_CAPTURE_LAYER.md \
  docs/public-launch/GITHUB_README_PUBLIC_PRODUCT_REWRITE.md \
  docs/public-launch/GITHUB_REPO_TOPICS_SOCIAL_PREVIEW_METADATA.md \
  docs/public-site/PUBLIC_ROADMAP_PAGE.md \
  docs/public-site/PUBLIC_ARCHITECTURE_OVERVIEW_PAGE.md \
  docs/public-signals/PUBLIC_RESEARCH_SIGNAL_LIBRARY.md \
  docs/public-signals/SAKANA_HERMES_CLAUDE_SIGNAL_PUBLIC_SUMMARY_LAYER.md \
  docs/public-trust/PUBLIC_DEMO_SAFETY_DISCLAIMER_LAYER.md \
  docs/public-launch/PUBLIC_FEEDBACK_INTAKE_MODEL.md \
  docs/public-launch/VERCEL_LAUNCH_READINESS_CHECKLIST.md \
  docs/public-launch/KNOWLEDGE_FACTORY_PUBLIC_ALPHA_LAUNCH_KERNEL.md \
  schemas/conductor-event.schema.json \
  schemas/worker-execution-contract.schema.json \
  schemas/worker-result-envelope.schema.json \
  schemas/public-feedback.schema.json \
  examples/public-launch/public-alpha-demo.json \
  examples/conductor/worker-result-envelope-demo.json \
  scripts/print_v70_public_alpha_kernel.sh \
  scripts/print_public_route_map.sh \
  apps/knowledgefactory-web/app/public-alpha/page.tsx \
  apps/knowledgefactory-web/app/api/public-alpha/status/route.ts \
  apps/knowledgefactory-web/app/public-showcase/page.tsx \
  apps/knowledgefactory-web/app/api/public-showcase/status/route.ts \
  apps/knowledgefactory-web/app/public-conductor/page.tsx \
  apps/knowledgefactory-web/app/api/public-conductor/status/route.ts \
  apps/knowledgefactory-web/app/public-roadmap/page.tsx \
  apps/knowledgefactory-web/app/public-architecture/page.tsx \
  apps/knowledgefactory-web/app/public-signals/page.tsx \
  apps/knowledgefactory-web/app/public-feedback/page.tsx
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
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

assert conductor_event_record("plan_created")["event_type"] == "plan_created"
assert worker_execution_contract("retrieval_worker")["role"] == "retrieval_worker"
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
print("🟢 Public launch Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
