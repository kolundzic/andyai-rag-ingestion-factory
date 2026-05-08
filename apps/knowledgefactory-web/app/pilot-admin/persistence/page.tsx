import { PageShell } from "../../components/PageShell";
import { pilotRequestPersistence, summarizePersistenceReadiness } from "../../lib/pilotRequestPersistence";

const summary = summarizePersistenceReadiness();

export default function PilotPersistencePage() {
  return (
    <PageShell title="Supabase Pilot Request Persistence" eyebrow="v17.0 persistence layer">
      <p>{pilotRequestPersistence.canonicalRule}</p>

      <div className="card">
        <strong>{pilotRequestPersistence.product}</strong>
        <p>Table: {pilotRequestPersistence.table}</p>
        <p>Migration: {pilotRequestPersistence.migration}</p>
        <p>{pilotRequestPersistence.serbianRule}</p>
      </div>

      <section>
        <h2>Persistence Readiness</h2>
        <div className="card">
          <p>Status: {summary.status}</p>
          <p>RLS: {summary.rlsState}</p>
          <p>Next: {summary.next}</p>
        </div>
      </section>

      <section>
        <h2>Persisted Fields</h2>
        <div className="card-grid">
          {pilotRequestPersistence.fields.map((field) => (
            <div className="card" key={field}><strong>{field}</strong></div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
