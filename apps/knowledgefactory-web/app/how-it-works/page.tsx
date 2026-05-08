import { PageShell } from "../../components/PageShell";

export default function HowItWorksPage() {
  return (
    <PageShell title="How it works" eyebrow="Factory flow">
      <p>Upload documents, ingest pages, preserve metadata, retrieve with permissions, package evidence, build Context Boards, draft with citations, and approve outputs.</p>
      <div className="card-grid">
        <div className="card"><strong>1. Ingest</strong><p>Register files, parse pages, and create traceable chunks.</p></div>
        <div className="card"><strong>2. Retrieve</strong><p>Use hybrid retrieval with permission boundaries.</p></div>
        <div className="card"><strong>3. Prove</strong><p>Return evidence packs, citations, and reviewable context.</p></div>
      </div>
    </PageShell>
  );
}
