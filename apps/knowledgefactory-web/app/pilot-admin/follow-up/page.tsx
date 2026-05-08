import { PageShell } from "../../components/PageShell";
import { draftForStatus, pilotFollowUpDrafts } from "../../lib/pilotFollowUpDrafts";

const draft = draftForStatus("approved_for_pilot");

export default function PilotFollowUpPage() {
  return (
    <PageShell title="Client Follow-Up Draft Layer" eyebrow="v18.2 client movement">
      <p>{pilotFollowUpDrafts.canonicalRule}</p>
      <div className="card">
        <strong>{draft.subject}</strong>
        <p>{draft.body}</p>
      </div>
    </PageShell>
  );
}
