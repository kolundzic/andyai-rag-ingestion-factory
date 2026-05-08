import { extendedCanonVisuals } from "../../../lib/extendedCanonVisuals";

export async function GET() {
  return Response.json({
    product: "AndyAI Knowledge Factory",
    site: "knowledgefactory.andyai.ai",
    count: extendedCanonVisuals.length,
    visuals: extendedCanonVisuals,
    canonical_rule: "Every important product layer should be visually explainable."
  });
}
