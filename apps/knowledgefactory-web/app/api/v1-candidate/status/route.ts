import { v1Candidate } from "../../../lib/v1Candidate";

export async function GET() {
  return Response.json({ v1_candidate: v1Candidate });
}
