import { PageShell } from "../components/PageShell";
import { publicSurface } from "../lib/publicSurface";

export default function PublicNavPage() {
  return (
    <PageShell title="Public Navigation" eyebrow="real demo route registry">
      <div className="card-grid">
        {publicSurface.routes.map((route) => <div className="card" key={route}><strong>{route}</strong></div>)}
      </div>
    </PageShell>
  );
}
