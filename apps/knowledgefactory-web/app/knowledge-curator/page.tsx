import { PageShell } from "../components/PageShell";
import { knowledgeCuratorDashboard } from "../lib/knowledgeCuratorDashboard";

export default function KnowledgeCuratorPage() {
  return (
    <PageShell title="Knowledge Curator Dashboard" eyebrow="v31 curator dashboard">
      <p>{knowledgeCuratorDashboard.canon}</p>
      <div className="card-grid">
        {knowledgeCuratorDashboard.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
