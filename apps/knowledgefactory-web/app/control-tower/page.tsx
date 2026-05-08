import { PageShell } from "../../components/PageShell";
import { controlTowerStatus } from "../../lib/controlTower";

export default function ControlTowerPage() {
  return (
    <PageShell title="Production Control Tower" eyebrow="v16 deploy governance">
      <p>{controlTowerStatus.rule}</p>
      <div className="card">
        <strong>{controlTowerStatus.product}</strong>
        <p>Site: {controlTowerStatus.site}</p>
        <p>Version: {controlTowerStatus.version}</p>
        <p>Readiness: {controlTowerStatus.readinessLevel}</p>
      </div>
      <div className="card-grid">
        {controlTowerStatus.gates.map((gate) => (
          <div className="card" key={gate.name}>
            <strong>{gate.name}</strong>
            <p>Status: {gate.status}</p>
            <p>{gate.detail}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
