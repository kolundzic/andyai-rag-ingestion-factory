import { PageShell } from "../../components/PageShell";
import { selfHostedRetrievalSignal } from "../../lib/selfHostedRetrieval";

export default function SelfHostedRetrievalPage() {
  return (
    <PageShell title="Self-Hosted Retrieval Lab" eyebrow="v16.3 signal layer">
      <p>{selfHostedRetrievalSignal.canonicalSentence}</p>
      <div className="card">
        <strong>Candidate adapters</strong>
        <p>{selfHostedRetrievalSignal.adapters.join(" | ")}</p>
      </div>
      <div className="card">
        <strong>Strict policy</strong>
        <p>{selfHostedRetrievalSignal.policy}</p>
      </div>
      <div className="card-grid">
        {selfHostedRetrievalSignal.flow.map((step) => (
          <div className="card" key={step}>
            <strong>{step}</strong>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
