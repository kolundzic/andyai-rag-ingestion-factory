import { publicSurface } from "../../../lib/publicSurface";

export async function GET() {
  return Response.json({ public_navigation: publicSurface.routes });
}
