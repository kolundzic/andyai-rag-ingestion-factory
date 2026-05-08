#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}"

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY v4.4.0 — Evidence-to-Draft Templates"
echo "━━━━━━━━━━━━━━━━━━━━"

python3 -m compileall src >/dev/null

python3 - <<'PY'
from rag_ingestion_factory.drafting.templates import render_template_draft, DEFAULT_TEMPLATES

pack = {
    "query": "demo",
    "answer_context": "Evidence says the pipeline prepares chunks.",
    "citations": [{"file_name": "demo.txt", "page_start": 1, "page_end": 1, "section_title": "Demo", "chunk_id": "chk_1"}]
}
draft = render_template_draft(pack, template_name="executive_brief")
assert "Executive Brief" in draft
assert "chk_1" in draft
assert "Citations" in draft
assert "executive_brief" in DEFAULT_TEMPLATES
print("🟢 Evidence-to-Draft template smoke test passed")
PY

test -f docs/30-drafting-templates/EVIDENCE_TO_DRAFT_TEMPLATES_v4_4.md
test -f src/rag_ingestion_factory/drafting/templates.py

echo "🟢 VERIFY PASSED"
