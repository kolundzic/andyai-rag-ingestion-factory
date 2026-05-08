import { wikiPressBridge } from "../../../lib/wikiPressBridge";

export async function GET() {
  return Response.json({ wikipress_bridge: wikiPressBridge });
}
