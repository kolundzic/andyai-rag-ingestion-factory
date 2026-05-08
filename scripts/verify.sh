#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v16.2.0 — Extended Canon Visual Series"
echo "━━━━━━━━━━━━━━━━━━━━"
for f in \
assets/canon-visuals/extended/human_in_the_loop_knowledge_approval_process.png \
assets/canon-visuals/extended/supabase_runtime_and_multi_tenant_model_overview.png \
assets/canon-visuals/extended/vercel_deploy_and_release_pipeline_diagram.png \
assets/canon-visuals/extended/evidence_pack_lifecycle_infographic_flowchart.png \
assets/canon-visuals/extended/permission_aware_access_map_for_andyai.png \
assets/canon-visuals/extended/knowledge_factory_platform_architecture_diagram.png \
docs/60-canon-visuals-extended/EXTENDED_CANON_VISUAL_SERIES_v16_2.md \
docs/60-canon-visuals-extended/VISUAL_SERIES_INDEX_v16_2.md \
docs/releases/RELEASE_NOTES_v16.2.0.md \
apps/knowledgefactory-web/app/visuals/extended/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/extended-demo/route.ts \
apps/knowledgefactory-web/lib/extendedCanonVisuals.ts \
scripts/print_v16_2_visual_inventory.sh; do test -f "$f"; done

echo "🟢 Extended canon visuals present"
echo "🟢 Docs present"
echo "🟢 Web page present"
echo "🟢 VERIFY PASSED"
