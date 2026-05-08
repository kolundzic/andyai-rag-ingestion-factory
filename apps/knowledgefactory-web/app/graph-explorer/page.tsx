import { PageShell } from "../../components/PageShell";
import { demoAtlas } from "../../lib/atlas";

export default function GraphExplorerPage() {
  return (
    <PageShell title="Graph Explorer" eyebrow="v14 interaction layer">
      <p>The Graph Explorer lets humans inspect nodes, edges, evidence, approval states, and contradiction paths.</p>
      <div className="card">
        <strong>Explorer panels</strong>
        <p>node detail | evidence panel | approval panel | contradiction panel | related wiki pages</p>
      </div>
      <div className="card">
        <strong>Current demo focus</strong>
        <p>{demoAtlas.nodes[2].label}</p>
      </div>
      <div className="card">
        <strong>Canonical rule</strong>
        <p>Structured knowledge should be visible, not only searchable.</p>
      </div>
    </PageShell>
  );
}
