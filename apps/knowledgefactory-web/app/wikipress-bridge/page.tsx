import { PageShell } from "../components/PageShell";
import { wikiPressBridge } from "../lib/wikiPressBridge";

export default function WikiPressBridgePage() {
  return (
    <PageShell title="WikiPress Product Bridge" eyebrow="v26 product bridge">
      <p>{wikiPressBridge.canon}</p>
      <div className="card-grid">
        {wikiPressBridge.productFormula.map((item) => <div className="card" key={item}><strong>{item}</strong></div>)}
      </div>
      <h2>Product Path</h2>
      <div className="card-grid">
        {wikiPressBridge.path.map((item) => <div className="card" key={item}><strong>{item}</strong></div>)}
      </div>
    </PageShell>
  );
}
