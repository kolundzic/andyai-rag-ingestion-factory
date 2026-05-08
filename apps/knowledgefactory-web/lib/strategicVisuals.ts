export const strategicVisuals = [
  {
    id: "strategic-01-system-overview",
    title: "AndyAI Knowledge Factory + LLM Wiki Bridge",
    file: "/canon-visuals/strategic/system_overview_andyai_knowledge_architecture.png",
    category: "system-overview",
    what: "Shows the complete bridge from raw sources to Knowledge Factory, KnowledgeBlocks, LLM Wiki, Knowledge Graph, trusted answers, AdAstraNova/BEYOND, and WikiPress.",
    why: "It gives non-technical viewers the whole product logic in one view.",
    coreMessage: "Knowledge Factory produces KnowledgeBlocks; LLM Wiki turns them into living pages."
  },
  {
    id: "strategic-02-ecosystem-map",
    title: "AndyAI Knowledge Ecosystem",
    file: "/canon-visuals/strategic/andyai_knowledge_ecosystem_diagram.png",
    category: "ecosystem",
    what: "Maps the repo/product layers: Knowledge Factory, LLM Wiki Layer, AdAstraNova/BEYOND, and WikiPress.",
    why: "It prevents confusion between engine, memory layer, implementation, and product.",
    coreMessage: "Factory first, wiki second, implementation proves, product scales."
  },
  {
    id: "strategic-03-living-wiki-loop",
    title: "Living Wiki Memory Loop",
    file: "/canon-visuals/strategic/living_wiki_memory_loop_diagram.png",
    category: "llm-wiki",
    what: "Explains RAW → KnowledgeBlocks → Wiki Pages → Query → Trusted Answer → Save Back.",
    why: "It shows that wiki memory is not static documentation but a maintained loop.",
    coreMessage: "Memory improves through use, linting, health checks, and review."
  },
  {
    id: "strategic-04-adastranova-beyond",
    title: "AdAstraNova / BEYOND Publishing Flow",
    file: "/canon-visuals/strategic/adastranova_beyond_system_flowchart.png",
    category: "publishing",
    what: "Shows how Knowledge Factory and LLM Wiki become a public publishing implementation.",
    why: "It positions AdAstraNova/BEYOND as the proof-of-model showcase.",
    coreMessage: "A book can become a living wiki with source-backed answers."
  },
  {
    id: "strategic-05-trust-governance",
    title: "Trust, Governance, and Approval",
    file: "/canon-visuals/strategic/trust_and_governance_flow_diagram.png",
    category: "governance",
    what: "Shows the controlled flow from extracted claims to approved KnowledgeBlocks.",
    why: "It explains why this is safer than ordinary RAG.",
    coreMessage: "No source, no trust. No human approval, no canon."
  },
  {
    id: "strategic-06-context-farmer",
    title: "Context Farmer",
    file: "/canon-visuals/strategic/system_workflow_for_scheduled_memory_growth.png",
    category: "runtime",
    what: "Shows scheduled ingest and memory growth with lint and health checks.",
    why: "It makes memory maintenance operational, not accidental.",
    coreMessage: "Knowledge stays fresh when the system has a disciplined update loop."
  },
  {
    id: "strategic-07-transformation-map",
    title: "From Documents to Product",
    file: "/canon-visuals/strategic/strategic_transformation_mapping_for_canon_visual.png",
    category: "strategy",
    what: "Shows the maturity ladder from documents to chunks, KnowledgeBlocks, LLM Wiki, AdAstraNova/BEYOND, and WikiPress.",
    why: "It translates technical architecture into business strategy.",
    coreMessage: "The shift is from storage to meaning, from retrieval to product."
  },
  {
    id: "strategic-08-wikipress-product",
    title: "AndyAI WikiPress Product Model",
    file: "/canon-visuals/strategic/product_model_overview_andyai_wikipress.png",
    category: "product",
    what: "Shows the future product model around upload, KnowledgeBlock engine, wiki compilation, publishing, query, and monetization.",
    why: "It turns the architecture into a SaaS/product roadmap.",
    coreMessage: "Upload once, compile meaning, publish clearly, query safely."
  },
  {
    id: "strategic-09-knowledgeblock-distillation",
    title: "KnowledgeBlock Distillation",
    file: "/canon-visuals/strategic/knowledgeblock_distillation_process_overview.png",
    category: "knowledgeblock",
    what: "Explains the transformation from raw documents and chunks into governed, evidence-backed KnowledgeBlocks.",
    why: "It is the key v20+ intellectual reactor visual.",
    coreMessage: "Chunks are weak containers; KnowledgeBlocks are governed units of knowledge."
  },
  {
    id: "strategic-10-ask-this-wiki",
    title: "Ask This Book / Ask This Wiki",
    file: "/canon-visuals/strategic/user_experience_flowchart_design_overview.png",
    category: "ux",
    what: "Shows the reader/user flow from question to routed retrieval, evidence check, trusted answer, citations, and save-back.",
    why: "It demonstrates the user-facing experience of the whole system.",
    coreMessage: "Readers should not fight the archive; knowledge should answer clearly with sources visible."
  }
];

export const strategicVisualSummary = {
  version: "v25.1.0",
  count: strategicVisuals.length,
  categories: ["system-overview", "ecosystem", "llm-wiki", "publishing", "governance", "runtime", "strategy", "product", "knowledgeblock", "ux"],
  canon: "Knowledge Factory produces KnowledgeBlocks. LLM Wiki compiles KnowledgeBlocks into living pages. AdAstraNova proves the publishing model. WikiPress turns it into a product."
};
