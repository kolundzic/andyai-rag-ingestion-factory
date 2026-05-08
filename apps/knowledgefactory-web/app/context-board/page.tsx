import { PageShell } from "../../components/PageShell";

export default function ContextBoardPage() {
  return (
    <PageShell title="Context Board" eyebrow="Evidence workspace">
      <p>Retrieval finds fragments. Context Board organizes evidence. Human judgment turns evidence into decisions.</p>
      <div className="card">
        <strong>Board contents</strong>
        <p>Query, citations, evidence items, operator notes, approval status, drafts, and review history.</p>
      </div>
    </PageShell>
  );
}
