import { PageShell } from "../../components/PageShell";
import { canonVisuals } from "../../lib/canonVisuals";
export default function CanonPage() {
  return <PageShell title="Canon Visual Pack" eyebrow="v16.1 explanation layer"><p>Before production deploy, the factory must be explainable at a glance.</p><div className="card-grid">{canonVisuals.map((visual) => <div className="card" key={visual.title}><strong>{visual.title}</strong><p>{visual.description}</p><p>{visual.file}</p></div>)}</div></PageShell>;
}
