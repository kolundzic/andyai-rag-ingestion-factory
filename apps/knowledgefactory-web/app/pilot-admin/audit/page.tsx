import { PageShell } from "../../components/PageShell";
import { pilotAuditTrail, summarizeAuditEvents } from "../../lib/pilotAuditTrail";

const summary = summarizeAuditEvents();

export default function PilotAuditPage() {
  return (
    <PageShell title="Pilot Review Audit Trail" eyebrow="v17.4 traceability layer">
      <p>{pilotAuditTrail.canonicalRule}</p>
      <div className="card">
        <strong>{pilotAuditTrail.table}</strong>
        <p>Total events: {summary.total}</p>
        <p>Status changes: {summary.status_changes}</p>
      </div>
      <div className="card-grid">
        {pilotAuditTrail.sampleEvents.map((event) => (
          <div className="card" key={event.pilot_request_id}>
            <strong>{event.action}</strong>
            <p>{event.from_status} → {event.to_status}</p>
            <p>{event.reason}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
