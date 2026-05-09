import { PageShell } from "../components/PageShell";
import { betaAdmin } from "../lib/publicBetaAdmin";

export default function BetaAdminPage() {
  return (
    <PageShell title="Public Beta Admin" eyebrow="review queues">
      <div className="card-grid">
        {betaAdmin.queues.map((queue) => <div className="card" key={queue}><strong>{queue}</strong></div>)}
      </div>
    </PageShell>
  );
}
