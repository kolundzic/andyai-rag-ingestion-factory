import { PageShell } from "../../components/PageShell";

const tiers = [
  ["Free", "Demo playground, limited documents, limited queries."],
  ["Pro", "Private workspace, saved Context Boards, evidence-to-draft."],
  ["Team", "Roles, approvals, shared workspaces, larger limits."],
  ["Enterprise", "Sovereign deployment, SSO, support, custom connectors."]
];

export default function PricingPage() {
  return (
    <PageShell title="Pricing" eyebrow="Subscription path">
      <p>Pricing will be based on workspaces, document pages, retrieval usage, evidence packs, and team governance needs.</p>
      <div className="card-grid">
        {tiers.map(([name, text]) => (
          <div className="card" key={name}>
            <strong>{name}</strong>
            <p>{text}</p>
          </div>
        ))}
      </div>
    </PageShell>
  );
}
