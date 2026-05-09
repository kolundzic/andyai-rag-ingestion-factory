import { PageShell } from "../components/PageShell";
import { releaseOperatorV2 } from "../lib/releaseOperatorV2";

export default function ReleaseOperatorV2Page() {
  return (
    <PageShell title="Release Operator Console v2" eyebrow="v45 release intelligence">
      <p>{releaseOperatorV2.canon}</p>
      <p>{releaseOperatorV2.formula}</p>
      <div className="card-grid">
        {releaseOperatorV2.panels.map((panel) => <div className="card" key={panel}><strong>{panel}</strong></div>)}
      </div>
    </PageShell>
  );
}
