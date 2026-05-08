create table if not exists public.pilot_request_audit_events (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  tenant_id text not null default 'demo-tenant',
  workspace_id text not null default 'demo-workspace',
  pilot_request_id text not null,
  actor text not null,
  action text not null,
  from_status text,
  to_status text,
  reason text,
  evidence jsonb not null default '{}'::jsonb,
  version text not null default 'v17.4.0'
);

create index if not exists idx_pilot_audit_request on public.pilot_request_audit_events (pilot_request_id);
create index if not exists idx_pilot_audit_created_at on public.pilot_request_audit_events (created_at desc);

alter table public.pilot_request_audit_events enable row level security;

drop policy if exists "pilot_audit_demo_select" on public.pilot_request_audit_events;
create policy "pilot_audit_demo_select" on public.pilot_request_audit_events for select using (true);
