import { PageShell } from "../components/PageShell";
import { betaPilotRequestForm } from "../lib/publicBetaForms";

export default function BetaPilotRequestPage() {
  return (
    <PageShell title="Public Beta Pilot Request" eyebrow="live wiring placeholder">
      <p>Pilot target: {betaPilotRequestForm.targetTable}</p>
      <div className="card-grid">
        {betaPilotRequestForm.fields.map((field) => <div className="card" key={field}><strong>{field}</strong></div>)}
      </div>
    </PageShell>
  );
}
