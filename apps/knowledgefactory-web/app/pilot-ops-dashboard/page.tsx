import { PageShell } from "../components/PageShell";
import { pilotOpsDashboard } from "../lib/pilotOpsDashboard";

export default function PilotOpsDashboardPage() {
  return (
    <PageShell title="Pilot Ops Dashboard" eyebrow="v18.3 operations layer">
      <p>{pilotOpsDashboard.canonicalRule}</p>
      <div className="card-grid">
        {Object.entries(pilotOpsDashboard.metrics).map(([key, value]) => (
          <div className="card" key={key}>
            <strong>{key}</strong>
            <p>{String(value)}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
