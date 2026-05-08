export const pilotReviewActions = {
  version: "v17.3.0",
  canonicalRule: "A review panel is not operational until decisions can be recorded.",
  allowedStatuses: ["new", "reviewing", "needs_scope", "approved_for_pilot", "rejected", "archived"],
  route: "/api/pilot-request/review"
};

export function applyReviewActionDemo(action: Record<string, unknown>) {
  return {
    ok: true,
    mode: "mock-review-action",
    version: pilotReviewActions.version,
    action: {
      request_id: action.request_id ?? "pilot-demo-001",
      next_status: action.next_status ?? "reviewing",
      review_owner: action.review_owner ?? "AndyAI operator",
      review_notes: action.review_notes ?? "Demo review notes.",
      next_action: action.next_action ?? "Schedule scoping call"
    },
    warnings: ["Demo response only. Persistence is prepared for a later hardened route."]
  };
}
