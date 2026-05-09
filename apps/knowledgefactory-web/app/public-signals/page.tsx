import { PageShell } from "../components/PageShell";
import { publicSignals } from "../lib/publicSignals";

export default function PublicSignalsPage() {
  return (
    <PageShell title="Public Research Signal Library" eyebrow="external signals">
      <div className="card-grid">
        {publicSignals.signals.map((signal) => <div className="card" key={signal.name}><strong>{signal.name}</strong><p>{signal.meaning}</p></div>)}
      </div>
    </PageShell>
  );
}
