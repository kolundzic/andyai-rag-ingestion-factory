import { draftForStatus, pilotFollowUpDrafts } from "../../../lib/pilotFollowUpDrafts";

export async function GET() {
  return Response.json({
    follow_up_layer: pilotFollowUpDrafts,
    sample: draftForStatus("approved_for_pilot")
  });
}
