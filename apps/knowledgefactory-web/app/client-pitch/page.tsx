import { PageShell } from "../components/PageShell";
import { clientPitchMode } from "../lib/clientPitchMode";

export default function ClientPitchPage() {
  return (
    <PageShell title="Visual Atlas Client Pitch Mode" eyebrow="v16.7 client-facing value layer">
      <p>{clientPitchMode.canonicalRule}</p>
      <div className="card">
        <strong>{clientPitchMode.oneLiner}</strong>
        <p>{clientPitchMode.shortPitch}</p>
        <p>{clientPitchMode.serbianRule}</p>
      </div>
      <section>
        <h2>Problem</h2>
        <div className="card"><p>{clientPitchMode.problem}</p></div>
      </section>
      <section>
        <h2>Solution</h2>
        <div className="card"><p>{clientPitchMode.solution}</p></div>
      </section>
      <section>
        <h2>Value Points</h2>
        <div className="card-grid">
          {clientPitchMode.valuePoints.map((point) => (
            <div className="card" key={point}><strong>{point}</strong></div>
          ))}
        </div>
      </section>
      <section>
        <h2>Pilot Offer</h2>
        <div className="card">
          <strong>{clientPitchMode.pilotOffer.name}</strong>
          <p>{clientPitchMode.pilotOffer.cta}</p>
        </div>
      </section>
    </PageShell>
  );
}
