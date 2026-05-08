create or replace function public.is_workspace_member(target_workspace_id uuid)
returns boolean
language sql
stable
as $$
  select exists (
    select 1
    from public.workspace_members wm
    where wm.workspace_id = target_workspace_id
      and wm.user_id = auth.uid()
  );
$$;

create or replace function public.has_workspace_role(target_workspace_id uuid, allowed_roles text[])
returns boolean
language sql
stable
as $$
  select exists (
    select 1
    from public.workspace_members wm
    where wm.workspace_id = target_workspace_id
      and wm.user_id = auth.uid()
      and wm.role = any(allowed_roles)
  );
$$;

drop policy if exists workspaces_member_read on public.workspaces;
create policy workspaces_member_read
on public.workspaces
for select
using (public.is_workspace_member(workspace_id));

drop policy if exists documents_member_read on public.documents;
create policy documents_member_read
on public.documents
for select
using (public.is_workspace_member(workspace_id));

drop policy if exists documents_editor_write on public.documents;
create policy documents_editor_write
on public.documents
for insert
with check (public.has_workspace_role(workspace_id, array['owner', 'admin', 'editor']));

drop policy if exists evidence_packs_member_read on public.evidence_packs;
create policy evidence_packs_member_read
on public.evidence_packs
for select
using (public.is_workspace_member(workspace_id));

drop policy if exists context_boards_member_read on public.context_boards;
create policy context_boards_member_read
on public.context_boards
for select
using (public.is_workspace_member(workspace_id));

drop policy if exists drafts_member_read on public.drafts;
create policy drafts_member_read
on public.drafts
for select
using (public.is_workspace_member(workspace_id));
