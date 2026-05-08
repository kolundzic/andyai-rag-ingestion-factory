import { PageShell } from "../components/PageShell";
import { llmWikiBridge } from "../lib/llmWikiBridge";

export default function LLMWikiBridgePage() {
  return (
    <PageShell title="Karpathy LLM Wiki Bridge" eyebrow="v25.2 bridge layer">
      <p>{llmWikiBridge.canon}</p>
      <div className="card-grid">
        {llmWikiBridge.layers.map((layer) => <div className="card" key={layer}><strong>{layer}</strong></div>)}
      </div>
      <div className="card-grid">
        {llmWikiBridge.integrations.map((item) => <div className="card" key={item.name}><strong>{item.name}</strong><p>{item.role}</p></div>)}
      </div>
    </PageShell>
  );
}
