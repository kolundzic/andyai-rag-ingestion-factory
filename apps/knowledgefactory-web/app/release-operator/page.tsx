import { PageShell } from "../components/PageShell";
import { releaseOperator } from "../lib/releaseOperator";

export default function ReleaseOperatorPage() {
  return (
    <PageShell title="Release Operator Console" eyebrow="v40 portable TAP-TAP runtime">
      <p>{releaseOperator.canon}</p>
      <p>{releaseOperator.formula}</p>
      <div className="card-grid">
        {releaseOperator.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
