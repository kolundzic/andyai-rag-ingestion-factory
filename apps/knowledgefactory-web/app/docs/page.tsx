import { PageShell } from "../../components/PageShell";

export default function DocsPage() {
  return (
    <PageShell title="Docs" eyebrow="Documentation entry">
      <p>Public documentation will explain ingestion, retrieval, permissions, evidence packs, Context Boards, and deployment modes.</p>
      <div className="card">
        <strong>GitHub repo</strong>
        <p>andyai-rag-ingestion-factory</p>
      </div>
    </PageShell>
  );
}
