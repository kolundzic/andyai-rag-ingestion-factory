#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v16.3.1 — Visual Asset Scope Cleanup"
echo "━━━━━━━━━━━━━━━━━━━━"

BASE_COUNT=0
EXT_COUNT=0
PUBLIC_BASE_COUNT=0
PUBLIC_EXT_COUNT=0

if [ -d assets/canon-visuals ]; then
  BASE_COUNT="$(find assets/canon-visuals -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')"
fi

if [ -d assets/canon-visuals/extended ]; then
  EXT_COUNT="$(find assets/canon-visuals/extended -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')"
fi

if [ -d apps/knowledgefactory-web/public/canon-visuals ]; then
  PUBLIC_BASE_COUNT="$(find apps/knowledgefactory-web/public/canon-visuals -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')"
fi

if [ -d apps/knowledgefactory-web/public/canon-visuals/extended ]; then
  PUBLIC_EXT_COUNT="$(find apps/knowledgefactory-web/public/canon-visuals/extended -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')"
fi

test "$BASE_COUNT" = "8"
test "$PUBLIC_BASE_COUNT" = "8"
test "$EXT_COUNT" = "6"
test "$PUBLIC_EXT_COUNT" = "6"

for f in \
assets/canon-visuals/andyai_knowledge_factory_architecture_diagram.png \
assets/canon-visuals/massive_document_ingestion_pipeline_infographic.png \
assets/canon-visuals/the_new_rag_paradigm_flowchart.png \
assets/canon-visuals/knowledge_workflows_and_production_control_tower.png \
assets/canon-visuals/the_andyai_knowledge_governance_workflow.png \
assets/canon-visuals/andyai_knowledge_factory_system_stack.png \
assets/canon-visuals/andyai_knowledge_factory_system_map.png \
assets/canon-visuals/andyai_product_surface_and_system_map.png \
assets/canon-visuals/extended/human_in_the_loop_knowledge_approval_process.png \
assets/canon-visuals/extended/supabase_runtime_and_multi_tenant_model_overview.png \
assets/canon-visuals/extended/vercel_deploy_and_release_pipeline_diagram.png \
assets/canon-visuals/extended/evidence_pack_lifecycle_infographic_flowchart.png \
assets/canon-visuals/extended/permission_aware_access_map_for_andyai.png \
assets/canon-visuals/extended/knowledge_factory_platform_architecture_diagram.png \
docs/62-visual-asset-cleanup/V16_3_1_VISUAL_ASSET_SCOPE_CLEANUP.md \
docs/releases/RELEASE_NOTES_v16.3.1.md; do
  test -f "$f"
done

echo "🟢 Base canon visuals: $BASE_COUNT"
echo "🟢 Public base canon visuals: $PUBLIC_BASE_COUNT"
echo "🟢 Extended canon visuals: $EXT_COUNT"
echo "🟢 Public extended canon visuals: $PUBLIC_EXT_COUNT"
echo "🟢 VERIFY PASSED"
