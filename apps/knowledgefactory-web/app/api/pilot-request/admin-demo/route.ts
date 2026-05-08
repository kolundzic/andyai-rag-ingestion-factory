import { pilotAdminReview, summarizePilotQueue } from "../../../lib/pilotAdminReview";

export async function GET() {
  return Response.json({
    admin_review_layer: pilotAdminReview,
    summary: summarizePilotQueue()
  });
}
