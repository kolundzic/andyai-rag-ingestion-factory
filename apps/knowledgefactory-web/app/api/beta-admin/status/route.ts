import { betaAdmin } from "../../../lib/publicBetaAdmin";

export async function GET() {
  return Response.json({ beta_admin: betaAdmin });
}
