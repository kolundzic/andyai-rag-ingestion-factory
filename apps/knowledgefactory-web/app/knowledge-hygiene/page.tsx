import { PageShell } from "../components/PageShell";
import { knowledgeCuratorDashboard } from "../lib/knowledgeCuratorDashboard";

export default function KnowledgeHygienePage() {
  return (
    <PageShell title="Knowledge Hygiene" eyebrow="v31 hygiene demo">
      <p>Knowledge hygiene prevents RAG from becoming a landfill of chunks.</p>
      <div className="card-grid">
        {Object.entries(knowledgeCuratorDashboard.demoMetrics).map(([key, value]) => (
          <div className="card" key={key}><strong>{key}</strong><p>{String(value)}</p></div>
        ))}
      </div>
    </PageShell>
  );
}
