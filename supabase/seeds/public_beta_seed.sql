insert into public_interest (name, message, source, status)
values ('Demo visitor', 'Interested in Knowledge Factory public beta.', 'seed', 'new')
on conflict do nothing;

insert into pilot_intake (company, use_case, status, priority, source)
values ('Demo Company', 'Governed RAG pilot', 'new', 'high', 'seed')
on conflict do nothing;
