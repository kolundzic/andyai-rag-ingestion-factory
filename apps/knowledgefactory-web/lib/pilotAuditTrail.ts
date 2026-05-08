export const pilotAuditTrail = {
  version: "v17.4.0",
  canonicalRule: "If a business decision changes state, the trace must survive the moment.",
  table: "public.pilot_request_audit_events",
  sampleEvents: [
    {
      pilot_request_id: "pilot-demo-001",
      actor: "AndyAI operator",
      action: "review_status_changed",
      from_status: "reviewing",
      to_status: "approved_for_pilot",
      reason: "Clear scope and measurable success criteria."
    }
  ]
};

export function summarizeAuditEvents(events = pilotAuditTrail.sampleEvents) {
  return { total: events.length, status_changes: events.filter(e => e.action === "review_status_changed").length };
}
