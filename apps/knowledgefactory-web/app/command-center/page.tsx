import { PageShell } from "../components/PageShell";
import { commandCenter } from "../lib/commandCenter";

export default function CommandCenterPage() {
  return (
    <PageShell title="Knowledge Factory Command Center" eyebrow="v19.0 production readiness">
      <p>{commandCenter.canonicalRule}</p>
      <div className="card">
        <strong>Status: {commandCenter.status}</strong>
        <p>Readiness score: {commandCenter.readiness.score}%</p>
      </div>
      <section>
        <h2>Modules</h2>
        <div className="card-grid">
          {commandCenter.modules.map((module) => (
            <div className="card" key={module}><strong>{module}</strong></div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
