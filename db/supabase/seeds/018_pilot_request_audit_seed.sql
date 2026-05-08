insert into public.pilot_request_audit_events (
  pilot_request_id,
  actor,
  action,
  from_status,
  to_status,
  reason
) values (
  'pilot-demo-001',
  'AndyAI operator',
  'review_status_changed',
  'reviewing',
  'approved_for_pilot',
  'Clear scope and measurable success criteria.'
)
on conflict do nothing;
