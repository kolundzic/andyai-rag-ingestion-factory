import { PageShell } from "../components/PageShell";
import { publicShowcase } from "../lib/publicShowcase";

export default function PublicShowcasePage() {
  return (
    <PageShell title="Knowledge Factory Public Showcase" eyebrow="public product surface">
      <p>{publicShowcase.message}</p>
      <div className="card-grid">
        {publicShowcase.pillars.map((pillar) => <div className="card" key={pillar}><strong>{pillar}</strong></div>)}
      </div>
    </PageShell>
  );
}
