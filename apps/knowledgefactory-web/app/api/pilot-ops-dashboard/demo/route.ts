import { pilotOpsDashboard } from "../../../lib/pilotOpsDashboard";

export async function GET() {
  return Response.json({ dashboard: pilotOpsDashboard });
}
