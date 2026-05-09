import { routeHealth } from "../../../lib/routeHealth";

export async function GET() {
  return Response.json({ route_health: routeHealth });
}
