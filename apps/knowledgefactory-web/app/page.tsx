import { SiteNav } from "../components/SiteNav";
import { layers, product } from "../lib/product";

export default function HomePage() {
  return (
    <main>
      <SiteNav />
      <section className="hero container">
        <div className="hero-grid">
          <div>
            <span className="badge">🟢 Product site: {product.site}</span>
            <h1>{product.name}</h1>
            <p>{product.headline}</p>
            <p>{product.subheadline}</p>
            <div className="cta-row">
              <a className="button primary" href="/playground">Explore the Playground</a>
              <a className="button" href="/architecture">View Architecture</a>
              <a className="button" href="/waitlist">Join Waitlist</a>
            </div>
          </div>
          <div className="card pipeline">
            {layers.map((layer) => (
              <div className="pipe" key={layer}>
                <span>{layer}</span>
                <span>→</span>
              </div>
            ))}
          </div>
        </div>
      </section>
      <section className="section container">
        <h2>Not a chatbot. A knowledge factory.</h2>
        <div className="card-grid">
          <div className="card">
            <strong>📄 Ingestion discipline</strong>
            <p>Documents become structured, page-aware, traceable chunks.</p>
          </div>
          <div className="card">
            <strong>📌 Evidence first</strong>
            <p>Answers must carry citations, context, and reviewable evidence.</p>
          </div>
          <div className="card">
            <strong>🔐 Permission-aware</strong>
            <p>Retrieval is shaped by tenant, role, user, and clearance boundaries.</p>
          </div>
        </div>
      </section>
      <footer className="footer container">{product.origin}</footer>
    </main>
  );
}
