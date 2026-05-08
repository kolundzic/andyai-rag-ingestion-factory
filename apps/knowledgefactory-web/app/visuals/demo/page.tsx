import { PageShell } from "../../../components/PageShell";
import { visualAtlasDemoSummary, visualAtlasLegends, visualAtlasStoryFlow } from "../../../lib/visualAtlasLegends";

export default function VisualAtlasDemoPage() {
  return (
    <PageShell title="Visual Atlas Product Demo" eyebrow="v16.5 guided explanation layer">
      <p>{visualAtlasDemoSummary.canonicalRule}</p>

      <div className="card">
        <strong>{visualAtlasDemoSummary.product}</strong>
        <p>Site: {visualAtlasDemoSummary.site}</p>
        <p>Total diagrams: {visualAtlasDemoSummary.totalDiagrams}</p>
        <p>Total textual legends: {visualAtlasDemoSummary.totalLegends}</p>
        <p>{visualAtlasDemoSummary.proverb}</p>
      </div>

      <section>
        <h2>Guided Story Flow</h2>
        <div className="card-grid">
          {visualAtlasStoryFlow.map((step) => (
            <div className="card" key={step.stepId}>
              <strong>{step.order}. {step.title}</strong>
              <p>{step.storyRole}</p>
              <p>{step.userQuestionAnswered}</p>
            </div>
          ))}
        </div>
      </section>

      <section>
        <h2>Diagram Legends</h2>
        <div className="card-grid">
          {visualAtlasLegends.map((legend) => (
            <div className="card" key={legend.id}>
              <img src={legend.image} alt={legend.title} style={{ width: "100%", height: "auto", borderRadius: "12px" }} />
              <strong>{legend.title}</strong>
              <p>{legend.oneLineMeaning}</p>
              <p><strong>What this shows:</strong> {legend.whatThisShows}</p>
              <p><strong>Why it matters:</strong> {legend.whyItMatters}</p>
              <p><strong>Practical takeaway:</strong> {legend.practicalTakeaway}</p>
              <p><strong>AndyAI angle:</strong> {legend.andyaiAngle}</p>
            </div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
