import { publicShowcase } from "../../../lib/publicShowcase";

export async function GET() {
  return Response.json({ public_showcase: publicShowcase });
}
