import { PageShell } from "../../components/PageShell";
import { canonVisuals } from "../../lib/canonVisuals";
export default function VisualsPage() {
  return <PageShell title="Visual Gallery" eyebrow="canonical product visuals"><p>The first canon.andyai.ai visual set integrated into the Knowledge Factory repo.</p><div className="card-grid">{canonVisuals.map((visual) => <div className="card" key={visual.title}><img src={visual.file} alt={visual.title} style={{ width: "100%", height: "auto", borderRadius: "12px" }} /><strong>{visual.title}</strong><p>{visual.description}</p></div>)}</div></PageShell>;
}
