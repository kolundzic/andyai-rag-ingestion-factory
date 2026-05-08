#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Visual Atlas Client Pitch Mode Rescue"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_visual_atlas_story_mode.sh

for f in \
docs/66-visual-atlas-client-pitch/VISUAL_ATLAS_CLIENT_PITCH_MODE.md \
docs/66-visual-atlas-client-pitch/CLIENT_PITCH_FLOW.md \
docs/66-visual-atlas-client-pitch/EXECUTIVE_SUMMARY.md \
docs/66-visual-atlas-client-pitch/PILOT_OFFER_COPY.md \
docs/66-visual-atlas-client-pitch/MEETING_DEMO_SCRIPT.md \
docs/66-visual-atlas-client-pitch/CLIENT_FAQ.md \
docs/66-visual-atlas-client-pitch/PITCH_COPY_BANK.md \
docs/releases/RELEASE_NOTES_v16.7.1.md \
schemas/client-pitch.schema.json \
schemas/pilot-offer.schema.json \
examples/visual-atlas-client-pitch/client-pitch-payload.json \
examples/visual-atlas-client-pitch/pilot-offer-payload.json \
apps/knowledgefactory-web/lib/clientPitchMode.ts \
apps/knowledgefactory-web/app/client-pitch/page.tsx \
apps/knowledgefactory-web/app/api/canon-visuals/client-pitch/route.ts; do
  test -f "$f"
done

grep -q "The atlas teaches the product" apps/knowledgefactory-web/lib/clientPitchMode.ts
grep -q "Document Intelligence Pilot" apps/knowledgefactory-web/lib/clientPitchMode.ts
grep -q "ClientPitchPage" apps/knowledgefactory-web/app/client-pitch/page.tsx
grep -q "clientPitchMode" apps/knowledgefactory-web/app/api/canon-visuals/client-pitch/route.ts

echo "🟢 Client pitch docs present"
echo "🟢 Client pitch page present"
echo "🟢 Client pitch API route present"
echo "🟢 Pilot offer payload present"
echo "🟢 Client pitch rescue verified"
