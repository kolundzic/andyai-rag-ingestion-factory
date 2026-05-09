export const conductorDemo = {
  version: "v55.0.0",
  signal: "Sakana RL Conductor",
  approvedIntent: "Answer a knowledge question with proof",
  strategy: "graph_plus_source_freshness",
  worker: "verifier",
  contextPolicy: "evidence_plus_answer",
  approval: "required",
  outcome: "trusted_knowledge_pending_human_approval"
};
