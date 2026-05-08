export const visualAtlas = [
  {
    id: "kf-architecture",
    title: "Knowledge Factory Architecture",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/andyai_knowledge_factory_architecture_diagram.png",
    description: "Master architecture overview for ingestion, retrieval, wiki, graph, atlas, workflows, and governance.",
    canonStatus: "locked"
  },
  {
    id: "massive-ingestion",
    title: "Massive Document Ingestion Pipeline",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/massive_document_ingestion_pipeline_infographic.png",
    description: "How 100–200 PDFs with around 1,000 pages each become structured ingestion assets.",
    canonStatus: "locked"
  },
  {
    id: "new-rag-paradigm",
    title: "The New RAG Paradigm",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/the_new_rag_paradigm_flowchart.png",
    description: "Why RAG is the retrieval layer, while Knowledge Factory creates governed durable knowledge.",
    canonStatus: "locked"
  },
  {
    id: "workflows-control-tower",
    title: "Knowledge Workflows & Production Control Tower",
    category: "Runtime and Deployment",
    file: "/canon-visuals/knowledge_workflows_and_production_control_tower.png",
    description: "Workflow execution, production gates, deploy readiness, and proof-bundle governance.",
    canonStatus: "locked"
  },
  {
    id: "knowledge-governance",
    title: "Knowledge Governance Workflow",
    category: "Governance and Trust",
    file: "/canon-visuals/the_andyai_knowledge_governance_workflow.png",
    description: "How retrieved fragments become claims, evidence packs, review items, approvals, and reusable knowledge.",
    canonStatus: "locked"
  },
  {
    id: "system-stack",
    title: "Knowledge Factory System Stack",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/andyai_knowledge_factory_system_stack.png",
    description: "Layered system stack from product surface to retrieval, AI synthesis, and governance.",
    canonStatus: "locked"
  },
  {
    id: "system-map",
    title: "Knowledge Factory System Map",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/andyai_knowledge_factory_system_map.png",
    description: "System-wide map connecting document ingestion, knowledge compilation, graph structure, and product experience.",
    canonStatus: "locked"
  },
  {
    id: "product-surface-map",
    title: "Product Surface & System Map",
    category: "Runtime and Deployment",
    file: "/canon-visuals/andyai_product_surface_and_system_map.png",
    description: "How public pages, operator tools, and backend intelligence modules connect.",
    canonStatus: "locked"
  },
  {
    id: "human-approval-loop",
    title: "Operator Review & Approval Loop",
    category: "Governance and Trust",
    file: "/canon-visuals/extended/human_in_the_loop_knowledge_approval_process.png",
    description: "Human-in-the-loop review, evidence check, approval, lock, export, and reuse.",
    canonStatus: "locked"
  },
  {
    id: "supabase-runtime",
    title: "Supabase Runtime & Multi-Tenant Model",
    category: "Runtime and Deployment",
    file: "/canon-visuals/extended/supabase_runtime_and_multi_tenant_model_overview.png",
    description: "Tenant isolation, Auth, RLS, subscriptions, usage metering, and approval-aware runtime.",
    canonStatus: "locked"
  },
  {
    id: "vercel-release",
    title: "Vercel Deploy & Release Pipeline",
    category: "Runtime and Deployment",
    file: "/canon-visuals/extended/vercel_deploy_and_release_pipeline_diagram.png",
    description: "GitHub, CI verify, version tag, Vercel build, preview deploy, production deploy, monitoring, and rollback.",
    canonStatus: "locked"
  },
  {
    id: "evidence-lifecycle",
    title: "Evidence Pack Lifecycle",
    category: "Governance and Trust",
    file: "/canon-visuals/extended/evidence_pack_lifecycle_infographic_flowchart.png",
    description: "How source material becomes traceable, auditable, human-reviewable evidence.",
    canonStatus: "locked"
  },
  {
    id: "permission-access",
    title: "Permission-Aware Access Map",
    category: "Governance and Trust",
    file: "/canon-visuals/extended/permission_aware_access_map_for_andyai.png",
    description: "Roles, workspaces, resources, approval paths, least privilege, and permission-aware access.",
    canonStatus: "locked"
  },
  {
    id: "super-poster",
    title: "100–200 PDFs × 1,000 Pages → Knowledge Factory",
    category: "Core Knowledge Factory",
    file: "/canon-visuals/extended/knowledge_factory_platform_architecture_diagram.png",
    description: "End-to-end super-poster summarizing the whole Knowledge Factory system.",
    canonStatus: "locked"
  }
];

export const visualAtlasSummary = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v16.4.0",
  total: visualAtlas.length,
  base: 8,
  extended: 6,
  canonicalRule: "Before production deploy, the factory must be explainable at a glance.",
  proverb: "Slike se ne kupe metlom — slike se biraju pincetom."
};
