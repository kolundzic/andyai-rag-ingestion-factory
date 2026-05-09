import { PageShell } from "../components/PageShell";
import { asal } from "../lib/asal";

export default function ASALPage() {
  return (
    <PageShell title={asal.title} eyebrow="v110 structural awareness">
      <p>{asal.subtitle}</p>
      <p>{asal.formula}</p>
      <div className="card-grid">
        {asal.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
