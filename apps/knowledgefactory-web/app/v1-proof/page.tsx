import { PageShell } from "../components/PageShell";

export default function V1ProofPage() {
  const proofs = ["POST routes", "Supabase tables", "RLS audit", "Vercel smoke", "Tailwind polish", "Trust wall", "Launch narrative"];
  return (
    <PageShell title="v1 Candidate Proof Pack" eyebrow="public beta proof">
      <div className="card-grid">
        {proofs.map((proof) => <div className="card" key={proof}><strong>{proof}</strong></div>)}
      </div>
    </PageShell>
  );
}
