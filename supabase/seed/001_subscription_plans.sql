insert into public.subscription_plans (
  plan_id,
  name,
  monthly_query_limit,
  monthly_page_limit,
  max_workspaces,
  max_members
) values
  ('free', 'Free', 100, 100, 1, 1),
  ('pro', 'Pro', 5000, 5000, 3, 3),
  ('team', 'Team', 50000, 50000, 10, 25),
  ('enterprise', 'Enterprise', 1000000, 1000000, 100, 1000)
on conflict (plan_id) do update set
  name = excluded.name,
  monthly_query_limit = excluded.monthly_query_limit,
  monthly_page_limit = excluded.monthly_page_limit,
  max_workspaces = excluded.max_workspaces,
  max_members = excluded.max_members;
