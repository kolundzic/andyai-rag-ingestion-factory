#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Proposal Generator"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_supabase_production_hardening.sh

for f in \
docs/75-pilot-proposal-generator/PILOT_PROPOSAL_GENERATOR.md \
docs/75-pilot-proposal-generator/PROPOSAL_SECTION_STANDARD.md \
docs/75-pilot-proposal-generator/PILOT_SCOPE_TO_PROPOSAL_MAPPING.md \
docs/75-pilot-proposal-generator/PROPOSAL_COPY_BANK.md \
schemas/pilot-proposal.schema.json \
apps/knowledgefactory-web/lib/pilotProposalGenerator.ts \
apps/knowledgefactory-web/app/pilot-admin/proposal/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/proposal-demo/route.ts \
src/rag_ingestion_factory/runtime/pilot_proposal.py \
tests/test_pilot_proposal.py; do
  test -f "$f"
done
PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.runtime.pilot_proposal import generate_pilot_proposal
assert "Example" in generate_pilot_proposal("Example")["title"]
print("🟢 Pilot proposal Python smoke test passed")
PY
echo "🟢 Pilot proposal generator verified"
