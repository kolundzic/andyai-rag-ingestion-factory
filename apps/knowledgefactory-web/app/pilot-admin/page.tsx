import { PageShell } from "../components/PageShell";
import { pilotAdminReview, summarizePilotQueue } from "../lib/pilotAdminReview";

const summary = summarizePilotQueue();

export default function PilotAdminPage() {
  return (
    <PageShell title="Pilot Intake Admin Review" eyebrow="v16.9 operator console">
      <p>{pilotAdminReview.canonicalRule}</p>

      <div className="card">
        <strong>{pilotAdminReview.product}</strong>
        <p>Site: {pilotAdminReview.site}</p>
        <p>{pilotAdminReview.serbianRule}</p>
      </div>

      <section>
        <h2>Queue Summary</h2>
        <div className="card-grid">
          <div className="card"><strong>Total</strong><p>{summary.total}</p></div>
          <div className="card"><strong>Approved</strong><p>{summary.approvedForPilot}</p></div>
          <div className="card"><strong>Needs Scope</strong><p>{summary.needsScope}</p></div>
          <div className="card"><strong>Reviewing</strong><p>{summary.reviewing}</p></div>
          <div className="card"><strong>High Priority</strong><p>{summary.highPriority}</p></div>
        </div>
      </section>

      <section>
        <h2>Incoming Pilot Requests</h2>
        <div className="card-grid">
          {pilotAdminReview.queue.map((item) => (
            <div className="card" key={item.requestId}>
              <strong>{item.organization}</strong>
              <p>{item.name} — {item.email}</p>
              <p>Documents: {item.documentCountRange}</p>
              <p>Domain: {item.primaryDomain}</p>
              <p>Privacy: {item.privacyLevel}</p>
              <p>Score: {item.qualificationScore}</p>
              <p>Status: {item.status}</p>
              <p>Priority: {item.priority}</p>
              <p>Next action: {item.nextAction}</p>
              <p>Notes: {item.reviewNotes}</p>
            </div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
