export const pilotAdminReview = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v16.9.0",
  canonicalRule: "A pilot request is not complete when it is submitted. It is complete when an operator can review it, score it, and decide the next action.",
  serbianRule: "Pilot zahtev nije završen kad je poslat. Završen je kad operator može da ga pregleda, oceni i odredi sledeći potez.",
  statuses: ["new", "reviewing", "needs_scope", "approved_for_pilot", "rejected", "archived"],
  priorities: ["high", "medium", "low"],
  queue: [
    {
      requestId: "pilot-demo-001",
      submittedAt: "2026-05-08T12:00:00Z",
      name: "Demo Client",
      email: "client@example.com",
      organization: "Example Organization",
      documentCountRange: "50–200 documents",
      primaryDomain: "technical documentation",
      privacyLevel: "internal business documents",
      qualificationScore: 100,
      status: "approved_for_pilot",
      priority: "high",
      nextAction: "Schedule pilot review call",
      reviewOwner: "AndyAI operator",
      reviewNotes: "Clear document scope, strong evidence-traceability need, and measurable success criteria."
    },
    {
      requestId: "pilot-demo-002",
      submittedAt: "2026-05-08T12:15:00Z",
      name: "Research Lead",
      email: "research@example.com",
      organization: "Research Lab",
      documentCountRange: "200–1,000 documents",
      primaryDomain: "research archive",
      privacyLevel: "unknown / needs review",
      qualificationScore: 70,
      status: "needs_scope",
      priority: "medium",
      nextAction: "Schedule scoping call",
      reviewOwner: "AndyAI operator",
      reviewNotes: "Promising use case, but privacy level and success criteria need clarification."
    },
    {
      requestId: "pilot-demo-003",
      submittedAt: "2026-05-08T12:30:00Z",
      name: "Curious Visitor",
      email: "visitor@example.com",
      organization: "Independent",
      documentCountRange: "20–50 documents",
      primaryDomain: "general curiosity",
      privacyLevel: "public / demo-safe",
      qualificationScore: 35,
      status: "reviewing",
      priority: "low",
      nextAction: "Send educational follow-up",
      reviewOwner: "AndyAI operator",
      reviewNotes: "Interest exists, but no clear business pain or pilot success metric yet."
    }
  ]
};

export function summarizePilotQueue() {
  const items = pilotAdminReview.queue;
  return {
    total: items.length,
    approvedForPilot: items.filter((item) => item.status === "approved_for_pilot").length,
    needsScope: items.filter((item) => item.status === "needs_scope").length,
    reviewing: items.filter((item) => item.status === "reviewing").length,
    highPriority: items.filter((item) => item.priority === "high").length
  };
}
