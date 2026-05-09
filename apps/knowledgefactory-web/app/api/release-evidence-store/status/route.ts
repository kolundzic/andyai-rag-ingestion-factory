import { releasePersistence } from "../../../lib/releasePersistence";

export async function GET() {
  return Response.json({ release_evidence_store: releasePersistence });
}
