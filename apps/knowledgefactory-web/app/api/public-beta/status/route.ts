import { publicBeta } from "../../../lib/publicBeta";

export async function GET() {
  return Response.json({ public_beta: publicBeta });
}
