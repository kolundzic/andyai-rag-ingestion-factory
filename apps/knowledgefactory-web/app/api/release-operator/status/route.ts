import { releaseOperator } from "../../../lib/releaseOperator";

export async function GET() {
  return Response.json({ release_operator: releaseOperator });
}
