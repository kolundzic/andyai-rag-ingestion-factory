import { PageShell } from "../components/PageShell";

export default function BetaTrustWallPage() {
  const proofs = ["Release Proof", "Route Health", "Conductor Layer", "Supabase Persistence", "Human Approval"];
  return (
    <PageShell title="Public Beta Trust Wall" eyebrow="proof and confidence">
      <div className="card-grid">
        {proofs.map((proof) => <div className="card" key={proof}><strong>{proof}</strong></div>)}
      </div>
    </PageShell>
  );
}
