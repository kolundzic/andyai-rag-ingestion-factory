create table if not exists public_interest (
  id uuid primary key default gen_random_uuid(),
  name text,
  email text,
  message text not null,
  source text not null default 'public_beta_feedback',
  status text not null default 'new',
  created_at timestamptz not null default now()
);

create table if not exists pilot_intake (
  id uuid primary key default gen_random_uuid(),
  company text not null,
  contact text,
  use_case text not null,
  status text not null default 'new',
  priority text not null default 'normal',
  source text not null default 'public_beta_pilot_request',
  created_at timestamptz not null default now()
);

alter table public_interest enable row level security;
alter table pilot_intake enable row level security;

create policy if not exists "public can insert interest"
on public_interest for insert
to anon
with check (true);

create policy if not exists "public can insert pilot intake"
on pilot_intake for insert
to anon
with check (true);
