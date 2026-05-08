#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v14.0.0 — Visual Atlas & Graph Explorer"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.visual_atlas.status import build_v14_visual_atlas_status
from rag_ingestion_factory.visual_atlas.builder import build_demo_atlas_view, build_demo_graph_explorer_session

status = build_v14_visual_atlas_status()
atlas = build_demo_atlas_view()
session = build_demo_graph_explorer_session()

assert status["site"] == "knowledgefactory.andyai.ai"
assert "topic_map" in status["views"]
assert atlas.view_type == "topic_map"
assert "claim_permissions_before_context" in atlas.visible_node_ids
assert session.view_type == "claim_network"

print("🟢 v14 status verified")
print("🟢 demo atlas builder verified")
print("🟢 graph explorer session verified")
PY

test -f docs/56-visual-atlas/V14_VISUAL_ATLAS_GRAPH_EXPLORER.md
test -f docs/56-visual-atlas/VISUAL_ATLAS_STANDARD.md
test -f docs/56-visual-atlas/GRAPH_EXPLORER_UI_SPEC.md
test -f docs/56-visual-atlas/ATLAS_VIEW_SCHEMA.md
test -f docs/56-visual-atlas/CONTRADICTION_MAP_STANDARD.md
test -f docs/56-visual-atlas/APPROVAL_STATUS_OVERLAY.md
test -f docs/releases/RELEASE_NOTES_v14.0.0.md
test -f schemas/atlas-view.schema.json
test -f schemas/graph-layout.schema.json
test -f examples/visual-atlas/sample-atlas.json
test -f examples/visual-atlas/sample-graph-explorer-session.json
test -f src/rag_ingestion_factory/visual_atlas/models.py
test -f src/rag_ingestion_factory/visual_atlas/builder.py
test -f src/rag_ingestion_factory/visual_atlas/status.py
test -f apps/knowledgefactory-web/app/atlas/page.tsx
test -f apps/knowledgefactory-web/app/graph-explorer/page.tsx
test -f apps/knowledgefactory-web/app/api/atlas/demo/route.ts
test -f apps/knowledgefactory-web/app/api/graph-explorer/demo/route.ts
test -f scripts/print_v14_visual_atlas_status.sh
test -f scripts/generate_v14_sample_atlas.sh

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "🟢 VERIFY PASSED"
