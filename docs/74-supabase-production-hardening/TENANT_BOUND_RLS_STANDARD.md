# Tenant-Bound RLS Standard

Production access must be bound to tenant and workspace claims.

```sql
using (tenant_id = auth.jwt() ->> 'tenant_id')
with check (tenant_id = auth.jwt() ->> 'tenant_id')
```
