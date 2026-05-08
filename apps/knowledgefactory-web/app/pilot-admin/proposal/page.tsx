import { PageShell } from "../../components/PageShell";
import { pilotProposalGenerator } from "../../lib/pilotProposalGenerator";

export default function PilotProposalPage() {
  const proposal = pilotProposalGenerator.proposal;
  return (
    <PageShell title="Pilot Proposal Generator" eyebrow="v18.1 proposal layer">
      <p>{pilotProposalGenerator.canonicalRule}</p>
      <div className="card">
        <strong>{proposal.title}</strong>
        <p>Next: {proposal.next_step}</p>
      </div>
      <div className="card-grid">
        {proposal.success_metrics.map((metric) => <div className="card" key={metric}><strong>{metric}</strong></div>)}
      </div>
    </PageShell>
  );
}
