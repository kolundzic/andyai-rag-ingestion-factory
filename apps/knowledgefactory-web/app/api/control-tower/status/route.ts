export async function GET() {
  return Response.json({
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    version: "v16.0.0",
    release: "Production Deploy Control Tower",
    readiness_level: "deploy-candidate",
    canonical_rule: "No production deploy without readiness gates, rollback path, and proof bundle."
  });
}
