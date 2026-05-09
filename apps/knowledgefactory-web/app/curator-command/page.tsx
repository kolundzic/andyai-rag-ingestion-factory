import { PageShell } from "../components/PageShell";
import { curatorCommand } from "../lib/curatorCommand";

export default function CuratorCommandPage() {
  return (
    <PageShell title="Curator Command" eyebrow="v32 guided action launch">
      <p>{curatorCommand.formula}</p>
      <p>{curatorCommand.canon}</p>
      <div className="card-grid">
        {curatorCommand.commandPanels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
