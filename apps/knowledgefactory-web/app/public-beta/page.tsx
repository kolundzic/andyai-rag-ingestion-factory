import { PageShell } from "../components/PageShell";
import { publicBeta } from "../lib/publicBeta";

export default function PublicBetaPage() {
  return (
    <PageShell title={publicBeta.title} eyebrow="v90 public beta">
      <p>{publicBeta.headline}</p>
      <p>{publicBeta.subheadline}</p>
      <p>{publicBeta.formula}</p>
      <div className="card-grid">
        {publicBeta.routes.map((route) => <div className="card" key={route}><strong>{route}</strong></div>)}
      </div>
    </PageShell>
  );
}
