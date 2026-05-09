import { asal } from "../../../lib/asal";

export async function GET() {
  return Response.json({ dashboard: { status: "ready", panels: asal.panels } });
}
