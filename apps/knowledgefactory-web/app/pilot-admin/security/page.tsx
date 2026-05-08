import { PageShell } from "../../components/PageShell";
import { scoreSecurityReadiness, supabaseSecurityHardening } from "../../lib/supabaseSecurityHardening";

const readiness = scoreSecurityReadiness(["tenant-bound RLS", "audit trail"]);

export default function SecurityPage() {
  return (
    <PageShell title="Supabase Production Hardening" eyebrow="v18.0 security layer">
      <p>{supabaseSecurityHardening.canonicalRule}</p>
      <div className="card">
        <strong>Readiness score: {readiness.score}%</strong>
        <p>{readiness.completed} / {readiness.total} checklist items marked in demo.</p>
      </div>
      <div className="card-grid">
        {supabaseSecurityHardening.checklist.map((item) => (
          <div className="card" key={item}><strong>{item}</strong></div>
        ))}
      </div>
    </PageShell>
  );
}
