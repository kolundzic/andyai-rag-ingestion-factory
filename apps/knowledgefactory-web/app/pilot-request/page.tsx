import { PageShell } from "../components/PageShell";
import { pilotRequestConversion, qualifyPilotRequest } from "../lib/pilotRequestConversion";

const demoQualification = qualifyPilotRequest({
  documentCountRange: "50–200 documents",
  mainProblem: "We need evidence-backed search across technical PDFs and internal reports.",
  successCriteria: "Users should find answers faster and verify source documents.",
  privacyLevel: "internal business documents"
});

export default function PilotRequestPage() {
  return (
    <PageShell title="Pilot Request" eyebrow="v16.8 conversion layer">
      <p>{pilotRequestConversion.canonicalRule}</p>

      <div className="card">
        <strong>{pilotRequestConversion.hero}</strong>
        <p>{pilotRequestConversion.formIntro}</p>
        <p>{pilotRequestConversion.serbianRule}</p>
      </div>

      <section>
        <h2>What We Need to Scope a Pilot</h2>
        <div className="card-grid">
          {pilotRequestConversion.fields.map((field) => (
            <div className="card" key={field}>
              <strong>{field}</strong>
            </div>
          ))}
        </div>
      </section>

      <section>
        <h2>Document Scope Options</h2>
        <div className="card-grid">
          {pilotRequestConversion.documentCountOptions.map((option) => (
            <div className="card" key={option}><strong>{option}</strong></div>
          ))}
        </div>
      </section>

      <section>
        <h2>Demo Qualification</h2>
        <div className="card">
          <strong>Status: {demoQualification.status}</strong>
          <p>Score: {demoQualification.score}</p>
          <p>{demoQualification.recommendation}</p>
          <p>{demoQualification.nextStep}</p>
        </div>
      </section>
    </PageShell>
  );
}
