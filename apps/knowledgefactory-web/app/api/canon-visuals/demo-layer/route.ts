import { visualAtlasDemoSummary, visualAtlasLegends, visualAtlasStoryFlow } from "../../../lib/visualAtlasLegends";

export async function GET() {
  return Response.json({
    summary: visualAtlasDemoSummary,
    story_flow: visualAtlasStoryFlow,
    legends: visualAtlasLegends
  });
}
