import { knowledgeCuratorDashboard } from "../../../lib/knowledgeCuratorDashboard";
export async function GET() { return Response.json({ demo: knowledgeCuratorDashboard.demoMetrics }); }
