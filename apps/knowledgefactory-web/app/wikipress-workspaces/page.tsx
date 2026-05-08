import { PageShell } from "../components/PageShell";
import { wikiPressWorkspaces } from "../lib/wikiPressWorkspaces";

export default function WikiPressWorkspacesPage() {
  return (
    <PageShell title="WikiPress Workspaces" eyebrow="v27 workspace model">
      <p>{wikiPressWorkspaces.canon}</p>
      <div className="card"><strong>{wikiPressWorkspaces.sampleWorkspace.name}</strong><p>{wikiPressWorkspaces.sampleWorkspace.plan}</p></div>
      <div className="card-grid">
        {wikiPressWorkspaces.roles.map((role) => <div className="card" key={role}><strong>{role}</strong></div>)}
      </div>
    </PageShell>
  );
}
