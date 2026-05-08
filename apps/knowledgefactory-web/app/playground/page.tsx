import { PageShell } from "../../components/PageShell";
import { demoEvidencePack } from "../../lib/demo";

export default function PlaygroundPage() {
  return (
    <PageShell title="RAG Playground" eyebrow="Public MVP demo">
      <p>The playground demonstrates the core rule: no citation, no trusted answer.</p>
      <div className="card">
        <strong>Demo query</strong>
        <p>{demoEvidencePack.query}</p>
      </div>
      <div className="card">
        <strong>Evidence-backed answer</strong>
        <p>{demoEvidencePack.answer}</p>
      </div>
      <div className="card">
        <strong>Citations</strong>
        {demoEvidencePack.citations.map((citation) => (
          <p key={citation.chunkId}>
            {citation.fileName} pp.{citation.pageStart}-{citation.pageEnd} | {citation.sectionTitle} | {citation.chunkId}
          </p>
        ))}
      </div>
    </PageShell>
  );
}
