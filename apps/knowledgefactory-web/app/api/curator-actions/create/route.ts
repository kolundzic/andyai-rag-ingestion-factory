import { curatorActionsRuntime } from "../../../../lib/curatorActionsRuntime";
export async function GET() { return Response.json({ created: curatorActionsRuntime.demoQueue[0] }); }
export async function POST() { return Response.json({ created: curatorActionsRuntime.demoQueue[0], mode: "demo" }); }
