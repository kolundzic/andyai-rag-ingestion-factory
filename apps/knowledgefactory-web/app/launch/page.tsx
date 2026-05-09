import { PageShell } from "../components/PageShell";
import { launchPack } from "../lib/launchPack";

export default function LaunchPage() {
  return (
    <PageShell title={launchPack.headline} eyebrow="launch announcement pack">
      <p>{launchPack.message}</p>
      <div className="card-grid">
        {launchPack.sections.map((section) => <div className="card" key={section}><strong>{section}</strong></div>)}
      </div>
    </PageShell>
  );
}
