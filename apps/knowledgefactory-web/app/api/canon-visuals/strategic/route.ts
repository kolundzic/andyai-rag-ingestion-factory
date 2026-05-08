import { strategicVisuals, strategicVisualSummary } from "../../../lib/strategicVisuals";

export async function GET() {
  return Response.json({ summary: strategicVisualSummary, visuals: strategicVisuals });
}
