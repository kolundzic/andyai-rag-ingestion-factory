import { PageShell } from "../../components/PageShell";
import { demoAtlas } from "../../lib/atlas";

export default function AtlasPage() {
  return (
    <PageShell title="Visual Atlas" eyebrow="v14 human understanding layer">
      <p>The atlas makes structured knowledge visible as a map, not only as search results.</p>
      <div className="card">
        <strong>{demoAtlas.title}</strong>
        <p>View type: {demoAtlas.viewType}</p>
        <p>Root node: {demoAtlas.rootNodeId}</p>
      </div>
      <div className="card">
        <strong>Visible nodes</strong>
        {demoAtlas.nodes.map((node) => (
          <p key={node.id}>{node.type} | {node.status} | {node.label}</p>
        ))}
      </div>
      <div className="card">
        <strong>Visible edges</strong>
        {demoAtlas.edges.map((edge) => (
          <p key={edge.id}>{edge.type} | {edge.from} → {edge.to}</p>
        ))}
      </div>
    </PageShell>
  );
}
