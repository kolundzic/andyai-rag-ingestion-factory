#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_wikipress_offer.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — WikiPress Workspace Model"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f schemas/wikipress-workspace.schema.json
test -f schemas/wikipress-project.schema.json
test -f apps/knowledgefactory-web/app/wikipress-workspaces/page.tsx
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wikipress.workspace import sample_workspace
assert sample_workspace()["id"] == "workspace-demo"
print("🟢 WikiPress workspace smoke test passed")
PY
echo "🟢 WikiPress workspace model verified"
