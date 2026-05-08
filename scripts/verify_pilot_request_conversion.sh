#!/usr/bin/env bash
set -euo pipefail

echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Pilot Request Conversion Layer"
echo "━━━━━━━━━━━━━━━━━━━━"

./scripts/verify_visual_atlas_client_pitch.sh

for f in \
docs/67-pilot-request-conversion/PILOT_REQUEST_CONVERSION_LAYER.md \
docs/67-pilot-request-conversion/PILOT_REQUEST_FORM_SPEC.md \
docs/67-pilot-request-conversion/PILOT_QUALIFICATION_MATRIX.md \
docs/67-pilot-request-conversion/PILOT_SUCCESS_METRICS.md \
docs/67-pilot-request-conversion/CONVERSION_COPY_BANK.md \
docs/releases/RELEASE_NOTES_v16.8.0.md \
schemas/pilot-request.schema.json \
schemas/pilot-qualification-result.schema.json \
examples/pilot-request-conversion/sample-pilot-request.json \
examples/pilot-request-conversion/sample-qualification-result.json \
apps/knowledgefactory-web/lib/pilotRequestConversion.ts \
apps/knowledgefactory-web/app/pilot-request/page.tsx \
apps/knowledgefactory-web/app/api/pilot-request/demo/route.ts; do
  test -f "$f"
done

grep -q "A pitch without a pilot path" apps/knowledgefactory-web/lib/pilotRequestConversion.ts
grep -q "qualifyPilotRequest" apps/knowledgefactory-web/lib/pilotRequestConversion.ts
grep -q "PilotRequestPage" apps/knowledgefactory-web/app/pilot-request/page.tsx
grep -q "pilotRequestConversion" apps/knowledgefactory-web/app/api/pilot-request/demo/route.ts

echo "🟢 Pilot request docs present"
echo "🟢 Pilot request page present"
echo "🟢 Pilot request API route present"
echo "🟢 Qualification logic present"
echo "🟢 Pilot request conversion verified"
