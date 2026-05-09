import { PageShell } from "../components/PageShell";
import { publicAlpha } from "../lib/publicAlpha";

export default function PublicAlphaPage() {
  return (
    <PageShell title="AndyAI Knowledge Factory Public Alpha" eyebrow="v70 public launch kernel">
      <p>{publicAlpha.canon}</p>
      <p>{publicAlpha.formula}</p>
      <div className="card-grid">
        {publicAlpha.routes.map((route) => <div className="card" key={route}><strong>{route}</strong></div>)}
      </div>
    </PageShell>
  );
}
