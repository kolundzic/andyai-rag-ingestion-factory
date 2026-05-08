import { PageShell } from "../../components/PageShell";
import { layers } from "../../lib/product";

export default function ArchitecturePage() {
  return (
    <PageShell title="Architecture" eyebrow="Sovereign Knowledge OS">
      <p>The architecture starts with ingestion discipline and ends with governed, observable knowledge workflows.</p>
      <div className="card-grid">
        {layers.map((layer) => (
          <div className="card" key={layer}>
            <strong>{layer}</strong>
            <p>Part of the evidence-governed knowledge factory chain.</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
