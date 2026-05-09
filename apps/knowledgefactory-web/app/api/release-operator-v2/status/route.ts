import { releaseOperatorV2 } from "../../../lib/releaseOperatorV2";

export async function GET() {
  return Response.json({ release_operator_v2: releaseOperatorV2 });
}
