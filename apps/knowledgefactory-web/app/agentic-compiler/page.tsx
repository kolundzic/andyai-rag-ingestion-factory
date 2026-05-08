import { PageShell } from "../../components/PageShell";
import { compilerContract } from "../../lib/workflows";

export default function AgenticCompilerPage() {
  return (
    <PageShell title="Agentic Compiler" eyebrow="Controlled agentic work">
      <p>Agentic compilation is controlled workflow execution over evidence-backed knowledge structures.</p>
      <div className="card">
        <strong>Allowed actions</strong>
        {compilerContract.allowed.map((action) => <p key={action}>{action}</p>)}
      </div>
      <div className="card">
        <strong>Forbidden actions</strong>
        {compilerContract.forbidden.map((action) => <p key={action}>{action}</p>)}
      </div>
    </PageShell>
  );
}
