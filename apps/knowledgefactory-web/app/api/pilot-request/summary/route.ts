import { pilotApiRoutes, summarizePilotApiItems } from "../../../lib/pilotApiRoutes";

export async function GET() {
  return Response.json({
    ok: true,
    mode: "mock-summary",
    version: pilotApiRoutes.version,
    summary: summarizePilotApiItems(),
    routes: pilotApiRoutes.routes
  });
}
