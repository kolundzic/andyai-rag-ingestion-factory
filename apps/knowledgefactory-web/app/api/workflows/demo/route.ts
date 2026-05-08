export async function GET() {
  return Response.json({
    workflow_run_id: "wf_wiki_compile_demo",
    workflow_type: "wiki_compile",
    status: "waiting_for_review",
    steps: [
      { step_id: "step_compile", step_type: "compile", status: "running", evidence_refs: ["evpack_demo_001"], human_required: false },
      { step_id: "step_review", step_type: "review", status: "waiting_for_review", evidence_refs: ["evpack_demo_001"], human_required: true },
      { step_id: "step_approve", step_type: "approve", status: "queued", evidence_refs: ["evpack_demo_001"], human_required: true }
    ],
    rule: "Agents may compile knowledge. Humans approve durable knowledge. Evidence remains attached."
  });
}
