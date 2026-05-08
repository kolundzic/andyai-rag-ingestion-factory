import { PageShell } from "../../components/PageShell";
import { selfHostedRetrievalSignal } from "../../lib/selfHostedRetrieval";

export default function VectorAdaptersPage() {
  return (
    <PageShell title="Vector Adapter Standard" eyebrow="vendor-neutral retrieval">
      <p>Vector databases are replaceable engines. Evidence governance is the durable product layer.</p>
      <div className="card-grid">
        {selfHostedRetrievalSignal.adapters.map((adapter) => (
          <div className="card" key={adapter}>
            <strong>{adapter}</strong>
            <p>Candidate backend for retrieval experiments and adapter standardization.</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
