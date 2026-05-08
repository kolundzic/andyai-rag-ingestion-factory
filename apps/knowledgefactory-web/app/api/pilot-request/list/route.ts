import { pilotApiRoutes } from "../../../lib/pilotApiRoutes";

export async function GET() {
  return Response.json({
    ok: true,
    mode: "mock-list",
    version: pilotApiRoutes.version,
    items: pilotApiRoutes.sampleItems,
    next: "Use /api/pilot-request/summary for aggregated state."
  });
}
