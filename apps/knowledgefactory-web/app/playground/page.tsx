import { PageShell } from "../../components/PageShell";

export default function PlaygroundPage() {
  return (
    <PageShell title="RAG Playground" eyebrow="Coming next">
      <p>This page will become the public demo surface for evidence-backed retrieval.</p>
      <div className="card">
        <strong>Future flow</strong>
        <p>Choose demo document → ask query → inspect retrieval → view citations → export evidence pack.</p>
      </div>
    </PageShell>
  );
}
