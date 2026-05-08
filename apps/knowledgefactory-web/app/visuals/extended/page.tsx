import { PageShell } from "../../../components/PageShell";
import { extendedCanonVisuals } from "../../../lib/extendedCanonVisuals";

export default function ExtendedVisualsPage() {
  return (
    <PageShell title="Extended Canon Visual Series" eyebrow="v16.2 explanation layer">
      <p>The second wave of canon.andyai.ai visuals for the AndyAI Knowledge Factory.</p>
      <div className="card-grid">
        {extendedCanonVisuals.map((visual) => (
          <div className="card" key={visual.title}>
            <img src={visual.file} alt={visual.title} style={{ width: "100%", height: "auto", borderRadius: "12px" }} />
            <strong>{visual.title}</strong>
            <p>{visual.description}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
