import { PageShell } from "../components/PageShell";
import { betaFeedbackForm } from "../lib/publicBetaForms";

export default function BetaFeedbackPage() {
  return (
    <PageShell title="Public Beta Feedback" eyebrow="live wiring placeholder">
      <p>Feedback target: {betaFeedbackForm.targetTable}</p>
      <div className="card-grid">
        {betaFeedbackForm.fields.map((field) => <div className="card" key={field}><strong>{field}</strong></div>)}
      </div>
    </PageShell>
  );
}
