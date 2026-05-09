import { launchPack } from "../../../lib/launchPack";

export async function GET() {
  return Response.json({ launch_pack: launchPack });
}
