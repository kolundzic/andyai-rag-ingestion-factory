import { PageShell } from "../../components/PageShell";

export default function OperatorConsolePage() {
  return (
    <PageShell title="Operator Console" eyebrow="Evidence visibility">
      <p>Operators need to see readiness, citations, manifests, governance audit, and release evidence before trusting output.</p>
      <div className="card-grid">
        <div className="card"><strong>Readiness</strong><p>Score the pipeline before showing output.</p></div>
        <div className="card"><strong>Evidence</strong><p>Show source-backed citations.</p></div>
        <div className="card"><strong>Governance</strong><p>Track audit events and approval state.</p></div>
      </div>
    </PageShell>
  );
}
