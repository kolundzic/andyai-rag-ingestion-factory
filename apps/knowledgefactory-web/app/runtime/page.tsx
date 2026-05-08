import { PageShell } from "../../components/PageShell";

export default function RuntimePage() {
  return (
    <PageShell title="Runtime API" eyebrow="v11 product API">
      <p>The product shell now exposes runtime-ready demo endpoints for health, evidence, Context Board, playground, and Qdrant status.</p>
      <div className="card">
        <strong>API rule</strong>
        <p>API endpoints must return evidence metadata, not only generated text.</p>
      </div>
    </PageShell>
  );
}
