import { visualAtlasStoryMode, getStoryNavigation } from "../../../lib/visualAtlasStoryMode";

export async function GET() {
  return Response.json({
    story_mode: visualAtlasStoryMode,
    first_step_navigation: getStoryNavigation("origin-problem")
  });
}
