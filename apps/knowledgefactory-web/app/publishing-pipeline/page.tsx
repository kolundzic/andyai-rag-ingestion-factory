import { PageShell } from "../components/PageShell";
import { publishingPipeline } from "../lib/publishingPipeline";

export default function PublishingPipelinePage() {
  return (
    <PageShell title="WikiPress Publishing Pipeline" eyebrow="v28 publishing">
      <p>{publishingPipeline.canon}</p>
      <div className="card-grid">
        {publishingPipeline.stages.map((stage) => <div className="card" key={stage}><strong>{stage}</strong></div>)}
      </div>
    </PageShell>
  );
}
