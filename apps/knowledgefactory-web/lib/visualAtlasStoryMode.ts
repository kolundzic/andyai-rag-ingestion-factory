export const visualAtlasStoryMode = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v16.6.0",
  canonicalRule: "A serious product should not only show its architecture — it should guide the user through it.",
  serbianRule: "Ozbiljan proizvod ne treba samo da pokaže arhitekturu — treba da provede čoveka kroz nju.",
  steps: [
    {
      id: "origin-problem",
      order: 1,
      title: "Origin Problem",
      diagramId: "super-poster",
      image: "/canon-visuals/extended/knowledge_factory_platform_architecture_diagram.png",
      narrative: "The project begins with the real problem: how to process 100–200 PDFs, each around 1,000 pages, without losing source trace, structure, or trust.",
      takeaway: "The original PDF problem becomes a full knowledge infrastructure product.",
      nextPrompt: "Now see how the factory turns raw documents into structured input."
    },
    {
      id: "ingestion-discipline",
      order: 2,
      title: "Ingestion Discipline",
      diagramId: "massive-ingestion",
      image: "/canon-visuals/massive_document_ingestion_pipeline_infographic.png",
      narrative: "Before retrieval can work, the factory must extract, clean, chunk, tag, and register documents in a disciplined ingestion pipeline.",
      takeaway: "Retrieval quality begins before retrieval.",
      nextPrompt: "Now see why RAG is useful, but not enough."
    },
    {
      id: "rag-positioning",
      order: 3,
      title: "New RAG Positioning",
      diagramId: "new-rag-paradigm",
      image: "/canon-visuals/the_new_rag_paradigm_flowchart.png",
      narrative: "RAG retrieves relevant fragments, but fragments alone are not durable knowledge. They need evidence, structure, and approval.",
      takeaway: "RAG is the intake machine; Knowledge Factory is the governed knowledge system.",
      nextPrompt: "Now follow the evidence layer."
    },
    {
      id: "evidence-foundation",
      order: 4,
      title: "Evidence Foundation",
      diagramId: "evidence-lifecycle",
      image: "/canon-visuals/extended/evidence_pack_lifecycle_infographic_flowchart.png",
      narrative: "Every serious claim needs traceable evidence: source, chunk, citation anchor, review status, and audit trail.",
      takeaway: "No evidence, no trusted answer.",
      nextPrompt: "Now see how humans approve knowledge."
    },
    {
      id: "human-governance",
      order: 5,
      title: "Human Governance",
      diagramId: "human-approval-loop",
      image: "/canon-visuals/extended/human_in_the_loop_knowledge_approval_process.png",
      narrative: "AI output is a proposal. It becomes trusted knowledge only after review, evidence checking, and approval.",
      takeaway: "Humans are not decorative; they are the governance layer.",
      nextPrompt: "Now see the full architecture."
    },
    {
      id: "architecture",
      order: 6,
      title: "System Architecture",
      diagramId: "kf-architecture",
      image: "/canon-visuals/andyai_knowledge_factory_architecture_diagram.png",
      narrative: "The architecture connects ingestion, retrieval, evidence, LLM Wiki, Knowledge Graph, workflows, visual atlas, and product surfaces.",
      takeaway: "Architecture must show where trust, structure, and approval enter the system.",
      nextPrompt: "Now inspect the layered stack."
    },
    {
      id: "system-stack",
      order: 7,
      title: "System Stack",
      diagramId: "system-stack",
      image: "/canon-visuals/andyai_knowledge_factory_system_stack.png",
      narrative: "The product is a stack: UI, runtime, data, retrieval, synthesis, governance, and deploy control all have separate responsibilities.",
      takeaway: "A professional AI product is a stack, not a prompt.",
      nextPrompt: "Now see how tenant runtime works."
    },
    {
      id: "runtime-isolation",
      order: 8,
      title: "Runtime Isolation",
      diagramId: "supabase-runtime",
      image: "/canon-visuals/extended/supabase_runtime_and_multi_tenant_model_overview.png",
      narrative: "A SaaS knowledge product needs auth, workspaces, tenant isolation, RLS, usage metering, and approval-aware runtime behavior.",
      takeaway: "Tenant isolation is a knowledge safety feature.",
      nextPrompt: "Now see the deployment path."
    },
    {
      id: "deploy-path",
      order: 9,
      title: "Deployment Path",
      diagramId: "vercel-release",
      image: "/canon-visuals/extended/vercel_deploy_and_release_pipeline_diagram.png",
      narrative: "The release path moves from GitHub to CI verify, tagging, Vercel preview, production deploy, monitoring, and rollback.",
      takeaway: "Deploy is not a button; deploy is a controlled path.",
      nextPrompt: "Now close the story with the product surface."
    },
    {
      id: "product-surface",
      order: 10,
      title: "Product Surface",
      diagramId: "product-surface-map",
      image: "/canon-visuals/andyai_product_surface_and_system_map.png",
      narrative: "The public product surface explains the factory while internal tools operate the knowledge workflow.",
      takeaway: "A serious product shows both interface and machinery.",
      nextPrompt: "Story complete: the atlas has turned architecture into understanding."
    }
  ]
};

export function getStoryNavigation(stepId: string) {
  const index = visualAtlasStoryMode.steps.findIndex((step) => step.id === stepId);
  if (index < 0) {
    return {
      currentStep: null,
      previousStep: null,
      nextStep: null,
      progressPercent: 0
    };
  }
  const current = visualAtlasStoryMode.steps[index];
  const previous = visualAtlasStoryMode.steps[index - 1] ?? null;
  const next = visualAtlasStoryMode.steps[index + 1] ?? null;
  return {
    currentStep: current.id,
    previousStep: previous?.id ?? null,
    nextStep: next?.id ?? null,
    progressPercent: Math.round(((index + 1) / visualAtlasStoryMode.steps.length) * 100)
  };
}
