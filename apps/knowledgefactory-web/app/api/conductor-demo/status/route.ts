import { conductorDemo } from "../../../lib/conductorDemo";

export async function GET() {
  return Response.json({ conductor_demo: conductorDemo });
}
