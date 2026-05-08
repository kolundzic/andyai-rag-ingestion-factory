export const llmWikiBridge = {
  version: "v25.2.0",
  title: "Karpathy LLM Wiki Bridge",
  canon: "Knowledge Factory produces KnowledgeBlocks. LLM Wiki compiles KnowledgeBlocks into living pages. AdAstraNova proves the publishing model. WikiPress turns it into a product.",
  layers: ["raw/", "KnowledgeBlocks", "wiki/", "query", "save-back", "lint", "health check"],
  integrations: [
    { name: "AdAstraNova / BEYOND", role: "public publishing proof-of-model" },
    { name: "AndyAI WikiPress", role: "productized wiki publishing layer" }
  ]
};
