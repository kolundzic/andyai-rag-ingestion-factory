import { PageShell } from "../components/PageShell";
import { asal } from "../lib/asal";

export default function ASALDashboardPage() {
  return (
    <PageShell title="Structural Awareness Dashboard" eyebrow="ASAL dashboard">
      <div className="card-grid">
        {asal.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong><p>ready</p></div>)}
      </div>
    </PageShell>
  );
}
