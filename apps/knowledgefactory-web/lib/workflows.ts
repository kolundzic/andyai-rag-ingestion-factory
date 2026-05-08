export const demoWorkflow = {
  title: "Wiki Compile Workflow",
  status: "waiting_for_review",
  flow: ["Compile", "Review", "Approve", "Export", "Reuse"],
  rule: "Agents may compile knowledge. Humans approve durable knowledge. Evidence remains attached.",
  reviewItem: {
    subject: "Permission-Aware Retrieval wiki page",
    proposedAction: "approve_compiled_knowledge",
    evidenceRefs: ["evpack_demo_001"],
    status: "pending"
  }
};

export const compilerContract = {
  allowed: [
    "read_evidence_pack",
    "compile_wiki_page",
    "propose_claim",
    "link_graph_nodes",
    "prepare_draft",
    "create_review_item",
    "prepare_export_bundle"
  ],
  forbidden: [
    "approve_own_output",
    "bypass_permissions",
    "remove_evidence",
    "externalize_unapproved_content",
    "overwrite_locked_knowledge"
  ]
};
