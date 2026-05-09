import { releaseProof } from "../../../lib/releaseProof";

export async function GET() {
  return Response.json({ release_proof: releaseProof });
}
