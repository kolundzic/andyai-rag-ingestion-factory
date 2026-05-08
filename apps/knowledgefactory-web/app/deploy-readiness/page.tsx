import { PageShell } from "../../components/PageShell";
import { controlTowerStatus } from "../../lib/controlTower";

export default function DeployReadinessPage() {
  return (
    <PageShell title="Deploy Readiness" eyebrow="production gate map">
      <p>Deployment readiness is measured through explicit gates, not intuition.</p>
      <div className="card">
        <strong>Current target</strong>
        <p>{controlTowerStatus.site}</p>
      </div>
      <div className="card">
        <strong>Next production move</strong>
        <p>v16.1.0 — Vercel Build Verification</p>
      </div>
    </PageShell>
  );
}
