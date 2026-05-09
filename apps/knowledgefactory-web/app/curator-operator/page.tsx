import { PageShell } from "../components/PageShell";
import { curatorOperator } from "../lib/curatorOperator";

export default function CuratorOperatorPage() {
  return (
    <PageShell title="Curator Operator Command Center" eyebrow="v33 operator layer">
      <p>{curatorOperator.canon}</p>
      <div className="card-grid">
        {curatorOperator.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
