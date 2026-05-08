#!/usr/bin/env bash
set -euo pipefail
./scripts/verify_wikipress_workspace.sh
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — WikiPress Publishing Pipeline"
echo "━━━━━━━━━━━━━━━━━━━━"
test -f docs/103-publishing-pipeline/WIKIPRESS_PUBLISHING_PIPELINE.md
test -f apps/knowledgefactory-web/app/publishing-pipeline/page.tsx
test -f apps/knowledgefactory-web/app/api/publishing-pipeline/status/route.ts
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.wikipress.publishing import publishing_pipeline_status
assert "publish" in publishing_pipeline_status()["stages"]
print("🟢 WikiPress publishing pipeline smoke test passed")
PY
echo "🟢 WikiPress publishing pipeline verified"
