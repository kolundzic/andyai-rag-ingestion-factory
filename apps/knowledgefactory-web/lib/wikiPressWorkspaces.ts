export const wikiPressWorkspaces = {
  version: "v27.0.0",
  canon: "A WikiPress workspace contains projects; projects contain sources, KnowledgeBlocks, wiki pages, publishing settings, and access rules.",
  roles: ["owner", "admin", "editor", "reviewer", "reader"],
  sampleWorkspace: { id: "workspace-demo", name: "Demo Workspace", plan: "Pro", status: "active" },
  sampleProject: { id: "project-demo", workspace_id: "workspace-demo", name: "Demo Wiki Project", publishing_mode: "private" }
};
