import { canonVisuals } from "../../../lib/canonVisuals";
export async function GET() {
  return Response.json({ product: "AndyAI Knowledge Factory", site: "knowledgefactory.andyai.ai", count: canonVisuals.length, visuals: canonVisuals, canonical_rule: "Before production deploy, the factory must be explainable at a glance." });
}
