import { PageShell } from "../components/PageShell";
import { releaseProof } from "../lib/releaseProof";

export default function ReleaseProofPage() {
  return (
    <PageShell title="Public Release Proof" eyebrow="v44 public proof layer">
      <p>Public demo proof for evidence-backed TAP-TAP releases.</p>
      <div className="card-grid">
        {releaseProof.proof.map((item) => <div className="card" key={item}><strong>{item}</strong></div>)}
      </div>
    </PageShell>
  );
}
