import { SiteNav } from "./SiteNav";

type PageShellProps = {
  title: string;
  eyebrow: string;
  children: React.ReactNode;
};

export function PageShell({ title, eyebrow, children }: PageShellProps) {
  return (
    <main>
      <SiteNav />
      <section className="section container">
        <span className="badge">{eyebrow}</span>
        <h1>{title}</h1>
        {children}
      </section>
    </main>
  );
}
