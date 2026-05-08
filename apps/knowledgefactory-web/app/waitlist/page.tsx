import { PageShell } from "../../components/PageShell";

export default function WaitlistPage() {
  return (
    <PageShell title="Join the waitlist" eyebrow="Early access">
      <p>The first public version will focus on demo documents, evidence-backed retrieval, Context Boards, and operator reports.</p>
      <div className="card">
        <strong>Next step</strong>
        <p>Supabase Auth and waitlist capture arrive in the runtime phase.</p>
      </div>
    </PageShell>
  );
}
