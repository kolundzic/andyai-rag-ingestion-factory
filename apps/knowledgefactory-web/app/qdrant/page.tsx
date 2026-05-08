import { PageShell } from "../../components/PageShell";

export default function QdrantPage() {
  return (
    <PageShell title="Live Qdrant Pipeline" eyebrow="v12 vector layer">
      <p>v12 defines the live vector retrieval path with payload permissions, hybrid merge, and evidence pack output.</p>
      <div className="card">
        <strong>Canonical rule</strong>
        <p>Permissions shape vector retrieval before context reaches the model.</p>
      </div>
    </PageShell>
  );
}
