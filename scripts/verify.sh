#!/usr/bin/env bash
set -euo pipefail
for f in \
assets/canon-visuals/andyai_knowledge_factory_architecture_diagram.png \
assets/canon-visuals/massive_document_ingestion_pipeline_infographic.png \
assets/canon-visuals/the_new_rag_paradigm_flowchart.png \
assets/canon-visuals/knowledge_workflows_and_production_control_tower.png \
assets/canon-visuals/the_andyai_knowledge_governance_workflow.png \
assets/canon-visuals/andyai_knowledge_factory_system_stack.png \
assets/canon-visuals/andyai_knowledge_factory_system_map.png \
assets/canon-visuals/andyai_product_surface_and_system_map.png \
docs/59-canon-visuals/CANON_VISUAL_PACK_v16_1.md \
docs/59-canon-visuals/VISUAL_INDEX_v16_1.md \
docs/releases/RELEASE_NOTES_v16.1.0.md \
apps/knowledgefactory-web/app/canon/page.tsx \
apps/knowledgefactory-web/app/visuals/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/demo/route.ts \
apps/knowledgefactory-web/lib/canonVisuals.ts; do test -f "$f"; done
echo "🟢 VERIFY PASSED"
