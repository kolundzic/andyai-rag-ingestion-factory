import { PageShell } from "../components/PageShell";
import { knowledgeQuality } from "../lib/knowledgeQuality";

export default function KnowledgeQualityPage() {
  return (
    <PageShell title="Knowledge Quality Control" eyebrow="v23 quality layer">
      <p>{knowledgeQuality.canonicalRule}</p>
      <div className="card"><strong>Sample score: {knowledgeQuality.sampleScore}</strong></div>
      <div className="card-grid">{knowledgeQuality.dimensions.map((d) => <div className="card" key={d}><strong>{d}</strong></div>)}</div>
    </PageShell>
  );
}
