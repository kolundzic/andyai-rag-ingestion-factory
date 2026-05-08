import { PageShell } from "../components/PageShell";
import { launchKernel } from "../lib/launchKernel";

export default function LaunchKernelPage() {
  return (
    <PageShell title="KnowledgeFactory / WikiPress Launch Kernel" eyebrow="v30 launch kernel">
      <p>{launchKernel.canon}</p>
      <div className="card-grid">
        {launchKernel.modules.map((module) => <div className="card" key={module}><strong>{module}</strong></div>)}
      </div>
      <h2>Next Arc</h2>
      <div className="card-grid">
        {launchKernel.nextArc.map((item) => <div className="card" key={item}><strong>{item}</strong></div>)}
      </div>
    </PageShell>
  );
}
