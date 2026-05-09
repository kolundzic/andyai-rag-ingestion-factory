export const curatorActionsRuntime = {
  version: "v32.3.0",
  actionTypes: ["refresh_source", "merge_duplicate", "repair_graph_edge", "attach_evidence", "request_human_review", "mark_stale", "verify_fix"],
  demoQueue: [
    { id: "action-1", action_type: "refresh_source", target_ref: "source-demo", status: "planned" },
    { id: "action-2", action_type: "merge_duplicate", target_ref: "kb-demo", status: "planned" }
  ]
};
