export const pilotRequestConversion = {
  product: "AndyAI Knowledge Factory",
  site: "knowledgefactory.andyai.ai",
  version: "v16.8.0",
  canonicalRule: "A pitch without a pilot path is only a presentation.",
  serbianRule: "Pitch bez pilot puta je samo prezentacija.",
  hero: "Start with a focused document pilot. Prove the Knowledge Factory value before scaling.",
  formIntro: "Tell us what document collection you want to test, what problem matters most, and what success would look like.",
  fields: [
    "name",
    "email",
    "organization",
    "document_count_range",
    "document_type",
    "primary_domain",
    "main_problem",
    "success_criteria",
    "privacy_level",
    "pilot_timeline",
    "notes"
  ],
  documentCountOptions: [
    "20–50 documents",
    "50–200 documents",
    "200–1,000 documents",
    "1,000+ documents"
  ],
  privacyOptions: [
    "public / demo-safe",
    "internal business documents",
    "regulated / confidential",
    "unknown / needs review"
  ],
  successMetrics: [
    "retrieval precision",
    "answer traceability",
    "time saved",
    "approved claims",
    "evidence packs produced",
    "production readiness gaps identified"
  ],
  qualificationStatuses: {
    green: "ready for pilot",
    yellow: "needs scoping call",
    red: "not ready / needs education"
  }
};

export function qualifyPilotRequest(input: {
  documentCountRange?: string;
  mainProblem?: string;
  successCriteria?: string;
  privacyLevel?: string;
}) {
  let score = 0;
  if (input.documentCountRange) score += 25;
  if (input.mainProblem && input.mainProblem.length > 20) score += 25;
  if (input.successCriteria && input.successCriteria.length > 20) score += 25;
  if (input.privacyLevel) score += 25;

  if (score >= 75) {
    return {
      status: "green",
      score,
      recommendation: "Ready for pilot scoping.",
      nextStep: "Schedule a pilot review call."
    };
  }
  if (score >= 40) {
    return {
      status: "yellow",
      score,
      recommendation: "Needs a scoping conversation before pilot.",
      nextStep: "Clarify document scope and success criteria."
    };
  }
  return {
    status: "red",
    score,
    recommendation: "Not ready for pilot yet.",
    nextStep: "Educate the prospect and collect clearer scope."
  };
}
