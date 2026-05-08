import { pilotRequestPersistence, summarizePersistenceReadiness } from "../../../lib/pilotRequestPersistence";

export async function GET() {
  return Response.json({
    persistence_layer: pilotRequestPersistence,
    readiness: summarizePersistenceReadiness()
  });
}
