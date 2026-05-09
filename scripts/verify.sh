#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Supabase Release Evidence Persistence + Live Operator Dashboard"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in   supabase/migrations/20260509_451_release_evidence_persistence.sql   supabase/seeds/release_evidence_seed.sql   docs/release-persistence/SUPABASE_RELEASE_EVIDENCE_PERSISTENCE.md   docs/release-persistence/RELEASE_HISTORY_TABLE_MODEL.md   docs/release-persistence/RELEASE_EVIDENCE_RECORD_SCHEMA.md   docs/release-persistence/RELEASE_EVIDENCE_PERSISTENCE_ADAPTER.md   docs/release-persistence/RELEASE_HISTORY_QUERY_LAYER.md   docs/live-operator/LIVE_RELEASE_OPERATOR_DASHBOARD.md   docs/live-operator/RELEASE_TIMELINE_VIEW.md   docs/live-operator/RELEASE_HEALTH_ROLLUP.md   docs/live-operator/RELEASE_INCIDENT_MEMORY_PANEL.md   docs/release-proof/PERSISTED_PUBLIC_RELEASE_PROOF.md   docs/release-persistence/V50_RELEASE_MEMORY_KERNEL.md   docs/release-persistence/V50_CANON_LOCK.md   docs/release-persistence/V50_NEXT_MASTER_PLAN.md   schemas/release-evidence-record.schema.json   schemas/release-history-query.schema.json   schemas/release-health-rollup.schema.json   examples/release-persistence/release-evidence-record-demo.json   examples/release-persistence/release-history-demo.json   scripts/capture_persisted_release_evidence.sh   scripts/print_release_history.sh   scripts/print_v50_release_memory_kernel.sh   apps/knowledgefactory-web/app/release-history/page.tsx   apps/knowledgefactory-web/app/api/release-history/status/route.ts   apps/knowledgefactory-web/app/release-live-dashboard/page.tsx   apps/knowledgefactory-web/app/api/release-live-dashboard/status/route.ts   apps/knowledgefactory-web/app/release-evidence-store/page.tsx   apps/knowledgefactory-web/app/api/release-evidence-store/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.release.persistence import release_evidence_record, release_history_query
from rag_ingestion_factory.release.health_rollup import release_health_rollup
from rag_ingestion_factory.release.timeline import release_timeline
from rag_ingestion_factory.release.incident_memory import release_incident_memory
from rag_ingestion_factory.release.evidence_store import evidence_store_status
from rag_ingestion_factory.release.live_dashboard import live_release_dashboard_status
from rag_ingestion_factory.release.public_proof import persisted_public_release_proof
from rag_ingestion_factory.release.release_memory_kernel import release_memory_kernel_status

record = release_evidence_record("v50.0.0", "v45.0.0", "green")
assert record["version"] == "v50.0.0"
assert release_history_query(limit=5)["status"] == "query_ready"
assert release_health_rollup(["green", "green"])["status"] == "green"
assert release_timeline(["v45.0.0", "v50.0.0"])["count"] == 2
assert release_incident_memory([])["incident_count"] == 0
assert evidence_store_status()["status"] == "store_ready"
assert live_release_dashboard_status()["status"] == "live_dashboard_ready"
assert persisted_public_release_proof("v50.0.0")["visibility"] == "public-demo"
assert release_memory_kernel_status()["version"] == "v50.0.0"
print("🟢 Release persistence Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
