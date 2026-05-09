import { PageShell } from "../components/PageShell";
import { v1Candidate } from "../lib/v1Candidate";

export default function V1CandidatePage() {
  return (
    <PageShell title={v1Candidate.title} eyebrow="v100 candidate">
      <p>{v1Candidate.canon}</p>
      <p>{v1Candidate.formula}</p>
      <div className="card-grid">
        {v1Candidate.routes.map((route) => <div className="card" key={route}><strong>{route}</strong></div>)}
      </div>
    </PageShell>
  );
}
