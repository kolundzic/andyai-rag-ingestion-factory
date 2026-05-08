import { PageShell } from "../../components/PageShell";
import { demoWorkflow } from "../../lib/workflows";

export default function WorkflowsPage() {
  return (
    <PageShell title="Knowledge Workflows" eyebrow="v15 action layer">
      <p>Knowledge Factory workflows turn evidence-backed structures into reviewable operational sequences.</p>
      <div className="card">
        <strong>{demoWorkflow.title}</strong>
        <p>Status: {demoWorkflow.status}</p>
        <p>{demoWorkflow.rule}</p>
      </div>
      <div className="card-grid">
        {demoWorkflow.flow.map((step) => (
          <div className="card" key={step}>
            <strong>{step}</strong>
            <p>Part of the governed knowledge workflow chain.</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
