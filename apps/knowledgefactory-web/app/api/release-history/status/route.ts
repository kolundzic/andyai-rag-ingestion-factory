import { releasePersistence } from "../../../lib/releasePersistence";

export async function GET() {
  return Response.json({ release_history: releasePersistence });
}
