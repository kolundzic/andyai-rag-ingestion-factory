import { pilotAuditTrail, summarizeAuditEvents } from "../../../lib/pilotAuditTrail";

export async function GET() {
  return Response.json({
    audit_trail: pilotAuditTrail,
    summary: summarizeAuditEvents()
  });
}
