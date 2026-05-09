import { PageShell } from "../components/PageShell";
import { conductorDemo } from "../lib/conductorDemo";

export default function ConductorDemoPage() {
  return (
    <PageShell title="Guided Knowledge Orchestration Demo" eyebrow="Sakana signal → AndyAI conductor">
      <p>Approved Intent → Conductor → Guided Action → Verified Outcome</p>
      <div className="card-grid">
        {Object.entries(conductorDemo).map(([key, value]) => <div className="card" key={key}><strong>{key}</strong><p>{String(value)}</p></div>)}
      </div>
    </PageShell>
  );
}
