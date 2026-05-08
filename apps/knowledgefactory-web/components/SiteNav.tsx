const links = [
  ["Pilot Admin", "/pilot-admin"],
  ["Pilot Request", "/pilot-request"],
  ["Client Pitch", "/client-pitch"],
  ["Self-Hosted Retrieval", "/self-hosted-retrieval"],
  ["Vector Adapters", "/vector-adapters"],
  ["Canon", "/canon"],
  ["Visuals", "/visuals"],
  ["Visual Atlas", "/visuals/atlas"],\n  ["Visual Demo", "/visuals/demo"],
  ["Story Mode", "/visuals/story"],
  ["Extended Visuals", "/visuals/extended"],
  ["Control Tower", "/control-tower"],
  ["Deploy Readiness", "/deploy-readiness"],
  ["Workflows", "/workflows"],
  ["Agentic Compiler", "/agentic-compiler"],
  ["Atlas", "/atlas"],
  ["Graph Explorer", "/graph-explorer"],
  ["How it works", "/how-it-works"],
  ["Architecture", "/architecture"],
  ["Playground", "/playground"],
  ["Operator Console", "/operator-console"],
  ["Pricing", "/pricing"],
  ["Docs", "/docs"]
];

export function SiteNav() {
  return (
    <nav className="nav container">
      <a className="brand" href="/">
        <span className="brand-mark">🧠</span>
        <span>AndyAI Knowledge Factory</span>
      </a>
      <div className="nav-links">
        {links.map(([label, href]) => (
          <a key={href} href={href}>{label}</a>
        ))}
      </div>
    </nav>
  );
}
