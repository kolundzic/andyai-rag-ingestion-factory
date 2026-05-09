import { PageShell } from "../components/PageShell";
import { publicSurface } from "../lib/publicSurface";

export default function PublicHomePage() {
  return (
    <PageShell title={publicSurface.headline} eyebrow="public alpha">
      <p>{publicSurface.subheadline}</p>
      <div className="card-grid">
        {publicSurface.ctas.map((cta) => <div className="card" key={cta.href}><strong>{cta.label}</strong><p>{cta.href}</p></div>)}
      </div>
    </PageShell>
  );
}
