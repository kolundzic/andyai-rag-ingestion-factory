import { PageShell } from "../components/PageShell";
import { wikiPressOffer } from "../lib/wikiPressOffer";

export default function WikiPressOfferPage() {
  return (
    <PageShell title="AndyAI WikiPress Offer" eyebrow="v26.1 offer layer">
      <p>{wikiPressOffer.promise}</p>
      <p>{wikiPressOffer.subhero}</p>
      <div className="card-grid">
        {wikiPressOffer.tiers.map((tier) => (
          <div className="card" key={tier.name}>
            <strong>{tier.name}</strong>
            <p>{tier.description}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
