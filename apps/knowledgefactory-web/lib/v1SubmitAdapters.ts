export type FeedbackPayload = {
  name?: string;
  email?: string;
  message: string;
};

export type PilotRequestPayload = {
  company: string;
  contact?: string;
  use_case: string;
  priority?: string;
};

export function normalizeFeedbackPayload(payload: FeedbackPayload) {
  return {
    name: payload.name ?? null,
    email: payload.email ?? null,
    message: payload.message,
    source: "public_beta_feedback",
    status: "new"
  };
}

export function normalizePilotRequestPayload(payload: PilotRequestPayload) {
  return {
    company: payload.company,
    contact: payload.contact ?? null,
    use_case: payload.use_case,
    priority: payload.priority ?? "normal",
    source: "public_beta_pilot_request",
    status: "new"
  };
}
