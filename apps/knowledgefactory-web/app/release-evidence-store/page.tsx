import { PageShell } from "../components/PageShell";
import { releasePersistence } from "../lib/releasePersistence";

export default function ReleaseEvidenceStorePage() {
  return (
    <PageShell title="Release Evidence Store" eyebrow="Supabase persistence layer">
      <p>Release evidence records, events, incidents and health are modeled for Supabase-backed persistence.</p>
      <div className="card-grid">
        {releasePersistence.tables.map((table) => <div className="card" key={table}><strong>{table}</strong></div>)}
      </div>
    </PageShell>
  );
}
