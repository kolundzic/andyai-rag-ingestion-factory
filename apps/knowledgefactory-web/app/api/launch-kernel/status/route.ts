import { launchKernel } from "../../../lib/launchKernel";

export async function GET() {
  return Response.json({ launch_kernel: launchKernel });
}
