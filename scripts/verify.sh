#!/usr/bin/env bash
set -euo pipefail
echo "━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFY — Public Alpha Polish + Vercel Production Surface"
echo "━━━━━━━━━━━━━━━━━━━━"

for f in \
  docs/public-alpha-polish/PUBLIC_ALPHA_HOME_POLISH.md \
  docs/navigation/PUBLIC_NAVIGATION_SYSTEM.md \
  docs/navigation/REAL_DEMO_ROUTE_REGISTRY.md \
  docs/navigation/CTA_FLOW_MAP.md \
  docs/vercel/ROUTE_HEALTH_CHECK_LAYER.md \
  docs/seo/SEO_METADATA_STANDARD.md \
  docs/seo/SOCIAL_PREVIEW_METADATA_STANDARD.md \
  docs/public-alpha-polish/MOBILE_READINESS_CHECKLIST.md \
  docs/vercel/VERCEL_DEPLOY_CHECKS.md \
  docs/public-trust/PUBLIC_ALPHA_PROOF_PANEL.md \
  docs/launch/LAUNCH_ANNOUNCEMENT_PACK.md \
  docs/launch/PUBLIC_ALPHA_OPERATOR_SCRIPT.md \
  docs/public-alpha-polish/V80_PUBLIC_ALPHA_SURFACE_KERNEL.md \
  docs/public-alpha-polish/V80_CANON_LOCK.md \
  docs/public-alpha-polish/V80_NEXT_MASTER_PLAN.md \
  schemas/public-route.schema.json \
  schemas/route-health.schema.json \
  schemas/launch-announcement.schema.json \
  examples/public-alpha-polish/public-route-registry-demo.json \
  examples/public-alpha-polish/launch-announcement-demo.json \
  scripts/print_v80_public_alpha_surface.sh \
  scripts/check_public_routes.sh \
  scripts/print_launch_announcement_pack.sh \
  apps/knowledgefactory-web/lib/publicSurface.ts \
  apps/knowledgefactory-web/lib/routeHealth.ts \
  apps/knowledgefactory-web/lib/launchPack.ts \
  apps/knowledgefactory-web/app/public-home/page.tsx \
  apps/knowledgefactory-web/app/api/public-home/status/route.ts \
  apps/knowledgefactory-web/app/public-nav/page.tsx \
  apps/knowledgefactory-web/app/api/public-nav/status/route.ts \
  apps/knowledgefactory-web/app/route-health/page.tsx \
  apps/knowledgefactory-web/app/api/route-health/status/route.ts \
  apps/knowledgefactory-web/app/launch/page.tsx \
  apps/knowledgefactory-web/app/api/launch/status/route.ts
do
  test -f "$f"
done

PYTHONPATH=src python3 - <<'PY'
from rag_ingestion_factory.public_alpha.home_polish import public_home_polish_status
from rag_ingestion_factory.public_alpha.navigation import public_navigation_registry, cta_flow_map
from rag_ingestion_factory.public_alpha.route_health import route_health_check, route_health_summary
from rag_ingestion_factory.public_alpha.seo import seo_metadata, social_preview_metadata
from rag_ingestion_factory.public_alpha.mobile import mobile_readiness_status
from rag_ingestion_factory.public_alpha.vercel import vercel_deploy_checks
from rag_ingestion_factory.public_alpha.proof import public_alpha_proof_panel
from rag_ingestion_factory.public_alpha.launch import launch_announcement_pack, public_alpha_operator_script
from rag_ingestion_factory.public_alpha.surface_kernel import public_alpha_surface_kernel_status

assert public_home_polish_status()["status"] == "home_polish_ready"
assert "/public-alpha" in public_navigation_registry()["routes"]
assert cta_flow_map()["primary_cta"] == "/pilot-request"
assert route_health_check("/public-alpha")["health"] == "green"
assert route_health_summary(["green", "green"])["status"] == "green"
assert seo_metadata()["title"].startswith("AndyAI Knowledge Factory")
assert social_preview_metadata()["status"] == "social_preview_ready"
assert mobile_readiness_status()["status"] == "mobile_ready"
assert vercel_deploy_checks()["status"] == "vercel_checks_ready"
assert public_alpha_proof_panel()["status"] == "proof_panel_ready"
assert launch_announcement_pack()["status"] == "launch_pack_ready"
assert public_alpha_operator_script()["status"] == "operator_script_ready"
assert public_alpha_surface_kernel_status()["version"] == "v80.0.0"
print("🟢 Public alpha surface Python smoke tests passed")
PY

echo "🟢 VERIFY PASSED"
