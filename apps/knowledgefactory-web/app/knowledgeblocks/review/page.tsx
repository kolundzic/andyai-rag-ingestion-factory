import { PageShell } from "../../components/PageShell";
import { knowledgeBlockReviewQueue } from "../../lib/knowledgeBlockReviewQueue";

export default function KnowledgeBlockReviewPage() {
  return (
    <PageShell title="KnowledgeBlock Review Queue" eyebrow="v20.8 human review">
      <p>{knowledgeBlockReviewQueue.canonicalRule}</p>
      <div className="card-grid">
        {knowledgeBlockReviewQueue.items.map((item) => (
          <div className="card" key={item.id}><strong>{item.id}</strong><p>{item.status}</p><p>{item.claim}</p></div>
        ))}
      </div>
    </PageShell>
  );
}
