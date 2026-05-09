import { releaseLiveDashboard } from "../../../lib/releaseLiveDashboard";

export async function GET() {
  return Response.json({ release_live_dashboard: releaseLiveDashboard });
}
