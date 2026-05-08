# Rollback Plan

## Git Rollback

```bash
git checkout <previous-tag>
```

## Vercel Rollback

Use Vercel dashboard deployment rollback to restore the last known good deployment.

## Supabase Rollback

Migrations must be reviewed before production application.

For destructive changes, create a reverse migration.

## Canonical Rule

```text
No deployment is production-ready until rollback is clear.
```
