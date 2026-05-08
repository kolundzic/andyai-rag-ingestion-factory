import { visualAtlas, visualAtlasSummary } from "../../../lib/visualAtlas";

export async function GET() {
  return Response.json({
    summary: visualAtlasSummary,
    visuals: visualAtlas
  });
}
