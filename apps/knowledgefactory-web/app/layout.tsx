import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "AndyAI Knowledge Factory",
  description: "Evidence-governed RAG for serious document intelligence.",
  metadataBase: new URL("https://knowledgefactory.andyai.ai")
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
