export const pilotFollowUpDrafts = {
  version: "v18.2.0",
  canonicalRule: "The review is internal. The follow-up turns it into client movement.",
  drafts: {
    approved_for_pilot: {
      subject: "Next step: AndyAI Knowledge Factory pilot review",
      body: "Thank you for the clear pilot request. The scope looks promising, and the recommended next step is a pilot review call."
    },
    needs_scope: {
      subject: "Clarifying your Knowledge Factory pilot scope",
      body: "Thank you for the request. Before a pilot proposal, we recommend a short scoping call to clarify documents, privacy level, and success criteria."
    },
    rejected: {
      subject: "Knowledge Factory pilot request update",
      body: "Thank you for your interest. This request is not the right fit for a pilot at this stage, but we appreciate the conversation."
    },
    reviewing: {
      subject: "Your Knowledge Factory pilot request is under review",
      body: "Thank you. Your pilot request is being reviewed and we will follow up with the recommended next step."
    }
  }
};

export function draftForStatus(status: keyof typeof pilotFollowUpDrafts.drafts) {
  return pilotFollowUpDrafts.drafts[status] ?? pilotFollowUpDrafts.drafts.reviewing;
}
