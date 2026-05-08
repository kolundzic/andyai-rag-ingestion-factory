const links = [
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
