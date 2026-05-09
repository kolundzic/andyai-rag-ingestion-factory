import { publicAlpha } from "../../../lib/publicAlpha";

export async function GET() {
  return Response.json({ public_alpha: publicAlpha });
}
