import { curatorActionsRuntime } from "../../../../lib/curatorActionsRuntime";
export async function GET() { return Response.json({ actions: curatorActionsRuntime.demoQueue }); }
