export const pilotApiRoutes = {
  product: "AndyAI Knowledge Factory",
  version: "v17.2.0",
  canonicalRule: "Runtime wiring connects the bridge. API routes define the traffic lanes.",
  routes: {
    create: "/api/pilot-request/create",
    list: "/api/pilot-request/list",
    summary: "/api/pilot-request/summary"
  },
  sampleItems: [
    {
      id: "pilot-demo-001",
      organization: "Example Organization",
      status: "approved_for_pilot",
      priority: "high",
      qualification_score: 100,
      next_action: "Schedule pilot review call"
    },
    {
      id: "pilot-demo-002",
      organization: "Research Lab",
      status: "needs_scope",
      priority: "medium",
      qualification_score: 70,
      next_action: "Schedule scoping call"
    }
  ]
};

export function summarizePilotApiItems(items = pilotApiRoutes.sampleItems) {
  return {
    total: items.length,
    approved_for_pilot: items.filter((item) => item.status === "approved_for_pilot").length,
    needs_scope: items.filter((item) => item.status === "needs_scope").length,
    high_priority: items.filter((item) => item.priority === "high").length
  };
}

export function createPilotRequestDemo(payload: Record<string, unknown>) {
  return {
    ok: true,
    mode: "mock-write-guarded",
    version: pilotApiRoutes.version,
    data: {
      id: "pilot-created-demo-001",
      ...payload,
      review_status: "new",
      priority: "medium",
      next_action: "assign reviewer"
    },
    warnings: ["Demo response only. Real Supabase write is guarded until production wiring is hardened."],
    next: "Review the request in /pilot-admin."
  };
}
