-- v18.0.0 — Production RLS Policy Templates

-- Template only. Review before applying in production.
-- alter table public.pilot_requests enable row level security;

-- create policy "tenant_select_pilot_requests"
-- on public.pilot_requests
-- for select
-- using (tenant_id = auth.jwt() ->> 'tenant_id');

-- create policy "tenant_insert_pilot_requests"
-- on public.pilot_requests
-- for insert
-- with check (tenant_id = auth.jwt() ->> 'tenant_id');
