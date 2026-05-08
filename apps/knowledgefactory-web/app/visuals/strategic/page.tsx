import { PageShell } from "../../components/PageShell";
import { strategicVisuals, strategicVisualSummary } from "../../lib/strategicVisuals";

export default function StrategicVisualsPage() {
  return (
    <PageShell title="Strategic Canon Visuals" eyebrow="v25.1 visual integration">
      <p>{strategicVisualSummary.canon}</p>
      <div className="card-grid">
        {strategicVisuals.map((visual) => (
          <div className="card" key={visual.id}>
            <img src={visual.file} alt={visual.title} style={{ width: "100%", borderRadius: "16px", border: "1px solid #e5e7eb" }} />
            <h2>{visual.title}</h2>
            <p><strong>What it shows:</strong> {visual.what}</p>
            <p><strong>Why it matters:</strong> {visual.why}</p>
            <p><strong>Core message:</strong> {visual.coreMessage}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
