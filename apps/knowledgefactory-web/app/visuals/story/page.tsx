import { PageShell } from "../../../components/PageShell";
import { visualAtlasStoryMode } from "../../../lib/visualAtlasStoryMode";

export default function VisualAtlasStoryPage() {
  return (
    <PageShell title="Visual Atlas Interactive Story Mode" eyebrow="v16.6 guided story">
      <p>{visualAtlasStoryMode.canonicalRule}</p>
      <div className="card"><strong>Ready for client-facing value framing?</strong><p>Open Client Pitch Mode at /client-pitch.</p></div>
      <div className="card">
        <strong>{visualAtlasStoryMode.product}</strong>
        <p>Site: {visualAtlasStoryMode.site}</p>
        <p>Story steps: {visualAtlasStoryMode.steps.length}</p>
        <p>{visualAtlasStoryMode.serbianRule}</p>
      </div>

      <section>
        <h2>Guided Story</h2>
        <div className="card-grid">
          {visualAtlasStoryMode.steps.map((step) => (
            <div className="card" key={step.id}>
              <img src={step.image} alt={step.title} style={{ width: "100%", height: "auto", borderRadius: "12px" }} />
              <strong>{step.order}. {step.title}</strong>
              <p>{step.narrative}</p>
              <p><strong>Takeaway:</strong> {step.takeaway}</p>
              <p><strong>Next:</strong> {step.nextPrompt}</p>
            </div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
