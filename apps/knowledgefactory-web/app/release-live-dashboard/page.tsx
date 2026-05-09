import { PageShell } from "../components/PageShell";
import { releaseLiveDashboard } from "../lib/releaseLiveDashboard";

export default function ReleaseLiveDashboardPage() {
  return (
    <PageShell title="Live Release Operator Dashboard" eyebrow="v50 release memory kernel">
      <p>{releaseLiveDashboard.formula}</p>
      <div className="card-grid">
        {releaseLiveDashboard.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
