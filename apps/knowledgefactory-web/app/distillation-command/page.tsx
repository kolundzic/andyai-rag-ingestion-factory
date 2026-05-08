import { PageShell } from "../components/PageShell";
import { distillationCommandLayer } from "../lib/distillationCommandLayer";

export default function DistillationCommandPage() {
  return (
    <PageShell title="Knowledge Distillation Command Layer" eyebrow="v22 command layer">
      <p>{distillationCommandLayer.canonicalRule}</p>
      <div className="card-grid">
        {distillationCommandLayer.commands.map((command) => <div className="card" key={command}><strong>{command}</strong></div>)}
      </div>
    </PageShell>
  );
}
