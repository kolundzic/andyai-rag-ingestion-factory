import { wikiPressWorkspaces } from "../../../lib/wikiPressWorkspaces";

export async function GET() {
  return Response.json({ wikipress_workspaces: wikiPressWorkspaces });
}
