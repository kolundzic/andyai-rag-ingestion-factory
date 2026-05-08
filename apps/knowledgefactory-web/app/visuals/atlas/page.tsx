import { PageShell } from "../../../components/PageShell";
import { visualAtlas, visualAtlasSummary } from "../../../lib/visualAtlas";

export default function VisualAtlasPage() {
  const categories = Array.from(new Set(visualAtlas.map((visual) => visual.category)));

  return (
    <PageShell title="Canon Visual Master Atlas" eyebrow="v16.4 official 14-diagram atlas">
      <p>{visualAtlasSummary.canonicalRule}</p>
      <div className="card">
        <strong>{visualAtlasSummary.product}</strong>
        <p>Site: {visualAtlasSummary.site}</p>
        <p>Total diagrams: {visualAtlasSummary.total} — base {visualAtlasSummary.base}, extended {visualAtlasSummary.extended}</p>
        <p>{visualAtlasSummary.proverb}</p>
      </div>

      {categories.map((category) => (
        <section key={category}>
          <h2>{category}</h2>
          <div className="card-grid">
            {visualAtlas
              .filter((visual) => visual.category === category)
              .map((visual) => (
                <div className="card" key={visual.id}>
                  <img src={visual.file} alt={visual.title} style={{ width: "100%", height: "auto", borderRadius: "12px" }} />
                  <strong>{visual.title}</strong>
                  <p>{visual.description}</p>
                  <p>Status: {visual.canonStatus}</p>
                </div>
              ))}
          </div>
        </section>
      ))}
    </PageShell>
  );
}
