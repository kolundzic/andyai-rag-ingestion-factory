import { PageShell } from "../components/PageShell";
import { routeHealth } from "../lib/routeHealth";

export default function RouteHealthPage() {
  return (
    <PageShell title="Route Health" eyebrow="public demo checks">
      <div className="card-grid">
        {routeHealth.routes.map((item) => <div className="card" key={item.route}><strong>{item.route}</strong><p>{item.health}</p></div>)}
      </div>
    </PageShell>
  );
}
