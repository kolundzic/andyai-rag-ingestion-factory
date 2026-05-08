import { PageShell } from "../../components/PageShell";
import { getSupabaseRuntimeStatus, supabaseRuntimeWiring } from "../../lib/supabaseRuntimeWiring";

const status = getSupabaseRuntimeStatus();

export default function PilotRuntimePage() {
  return (
    <PageShell title="Supabase Runtime Wiring" eyebrow="v17.1 runtime bridge">
      <p>{supabaseRuntimeWiring.canonicalRule}</p>

      <div className="card">
        <strong>{supabaseRuntimeWiring.product}</strong>
        <p>Table: {supabaseRuntimeWiring.table}</p>
        <p>{supabaseRuntimeWiring.serbianRule}</p>
      </div>

      <section>
        <h2>Runtime Status</h2>
        <div className="card">
          <p>Mode: {status.runtime_mode}</p>
          <p>Database connected: {String(status.database_connected)}</p>
          <p>Writes enabled: {String(status.writes_enabled)}</p>
          <p>{status.safe_message}</p>
        </div>
      </section>

      <section>
        <h2>Required Environment</h2>
        <div className="card-grid">
          {supabaseRuntimeWiring.requiredEnv.map((key) => (
            <div className="card" key={key}><strong>{key}</strong></div>
          ))}
        </div>
      </section>

      <section>
        <h2>Adapter Operations</h2>
        <div className="card-grid">
          {supabaseRuntimeWiring.adapterOperations.map((operation) => (
            <div className="card" key={operation}><strong>{operation}</strong></div>
          ))}
        </div>
      </section>
    </PageShell>
  );
}
