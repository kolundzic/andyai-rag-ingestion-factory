#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 AndyAI RAG Ingestion Factory VERIFY"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from pathlib import Path
from rag_ingestion_factory.core.pipeline_v1 import ingest_local_file

out = Path("examples/output/verify_run")
manifest = ingest_local_file("examples/sample_documents/demo_document.txt", out)

assert manifest["status"] == "completed"
assert manifest["chunks_count"] >= 1
assert (out / "chunks.jsonl").exists()
assert (out / "manifest.json").exists()
assert (out / "keyword_index.json").exists()

print("🟢 Local ingestion smoke test passed")
print(f"🟢 Chunks created: {manifest['chunks_count']}")
PY

test -f README.md
test -f CONTRIBUTING.md
test -f SECURITY.md
test -f CODE_OF_CONDUCT.md
test -f docs/12-public/PUBLIC_REPO_POSITIONING.md
test -f docs/12-public/SOCIAL_PREVIEW_STANDARD.md
test -f docs/releases/RELEASE_NOTES_v1.3.1.md
test -f docs/00-canon/PUBLIC_CANON.md
test -f scripts/apply_github_metadata.sh
test -f .github/ISSUE_TEMPLATE/bug_report.md
test -f .github/ISSUE_TEMPLATE/feature_request.md
test -f .github/pull_request_template.md

if command -v pytest >/dev/null 2>&1; then
  PYTHONPATH=src pytest
else
  echo "🟡 pytest not installed; skipped unit tests"
fi

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🟢 VERIFY PASSED"
echo "━━━━━━━━━━━━━━━━━━━━"
