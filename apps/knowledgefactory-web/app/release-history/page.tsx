import { PageShell } from "../components/PageShell";
import { releasePersistence } from "../lib/releasePersistence";

export default function ReleaseHistoryPage() {
  return (
    <PageShell title="Release History" eyebrow="v45.2 release memory">
      <p>{releasePersistence.canon}</p>
      <div className="card-grid">
        {releasePersistence.tables.map((table) => <div className="card" key={table}><strong>{table}</strong></div>)}
      </div>
    </PageShell>
  );
}
