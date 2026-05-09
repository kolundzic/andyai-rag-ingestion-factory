import { betaPilotRequestForm } from "../../../lib/publicBetaForms";

export async function GET() {
  return Response.json({ beta_pilot_request: betaPilotRequestForm });
}
