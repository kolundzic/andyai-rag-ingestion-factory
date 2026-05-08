import { applyReviewActionDemo } from "../../../lib/pilotReviewActions";

export async function PATCH(request: Request) {
  const payload = await request.json().catch(() => ({}));
  return Response.json(applyReviewActionDemo(payload));
}

export async function GET() {
  return Response.json(applyReviewActionDemo({
    request_id: "pilot-demo-001",
    next_status: "approved_for_pilot",
    review_owner: "AndyAI operator",
    review_notes: "Clear scope and measurable success criteria.",
    next_action: "Send pilot proposal"
  }));
}
