import { curatorOperator } from "../../../lib/curatorOperator";

export async function GET() {
  return Response.json({ curator_operator: curatorOperator });
}
