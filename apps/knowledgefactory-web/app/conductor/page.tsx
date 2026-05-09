import { PageShell } from "../components/PageShell";
import { conductor } from "../lib/conductor";

export default function ConductorPage() {
  return (
    <PageShell title="AndyAI Conductor Layer" eyebrow="v55 guided orchestration">
      <p>{conductor.canon}</p>
      <p>{conductor.formula}</p>
      <div className="card-grid">
        {conductor.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
