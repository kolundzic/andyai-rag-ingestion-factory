import { betaFeedbackForm } from "../../../lib/publicBetaForms";

export async function GET() {
  return Response.json({ beta_feedback: betaFeedbackForm });
}
