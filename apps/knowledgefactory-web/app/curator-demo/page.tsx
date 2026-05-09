import { PageShell } from "../components/PageShell";
import { curatorDemo } from "../lib/curatorDemo";

export default function CuratorDemoPage() {
  return (
    <PageShell title="Knowledge Curator Production Demo" eyebrow="v35 production demo kernel">
      <p>{curatorDemo.canon}</p>
      <p>{curatorDemo.formula}</p>
      <div className="card-grid">
        {curatorDemo.steps.map((step) => <div className="card" key={step}><strong>{step}</strong></div>)}
      </div>
    </PageShell>
  );
}
