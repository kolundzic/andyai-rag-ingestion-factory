import { PageShell } from "../components/PageShell";
import { knowledgeBlockFactory } from "../lib/knowledgeBlockFactory";

export default function KnowledgeBlockFactoryPage() {
  return (
    <PageShell title="Sovereign KnowledgeBlock Factory" eyebrow="v25.0 intellectual reactor">
      <p>{knowledgeBlockFactory.canonicalRule}</p>
      <div className="card">
        <strong>Status: {knowledgeBlockFactory.status}</strong>
        <p>Readiness: {knowledgeBlockFactory.readiness.score}%</p>
      </div>
      <div className="card-grid">
        {knowledgeBlockFactory.modules.map((module) => <div className="card" key={module}><strong>{module}</strong></div>)}
      </div>
    </PageShell>
  );
}
