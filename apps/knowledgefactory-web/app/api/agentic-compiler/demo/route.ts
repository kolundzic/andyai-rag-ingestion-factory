export async function GET() {
  return Response.json({
    task_id: "agentic_compiler_demo_001",
    task_type: "compile_wiki_page",
    allowed_actions: [
      "read_evidence_pack",
      "compile_wiki_page",
      "propose_claim",
      "link_graph_nodes",
      "prepare_draft",
      "create_review_item",
      "prepare_export_bundle"
    ],
    forbidden_actions: [
      "approve_own_output",
      "bypass_permissions",
      "remove_evidence",
      "externalize_unapproved_content",
      "overwrite_locked_knowledge"
    ],
    requires_human_approval: true,
    evidence_required: true
  });
}
