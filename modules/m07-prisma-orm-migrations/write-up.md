# M07 Write-Up — Prisma ORM & Migrations

## What I built

Task API v2: M06 schema translated into Prisma, with:
- `schema.prisma` — User, Task, Tag models with relations
- 2+ migrations (one hand-edited via `--create-only`)
- Service layer replacing the in-memory store from M05
- Filtered/sorted/paginated listing (`status`/`q` filters, `page`/`pageSize` pagination)
- Seed script (idempotent)
- Prisma error mapping: P2002 → 409, P2025 → 404, P2003 → 409

## Why it's built this way (key decisions)

- **Prisma 7 with `better-sqlite3`:** The generated client needs a driver adapter. Used
  `@prisma/adapter-better-sqlite3`.
- **`prisma7.config.ts`:** Holds the datasource URL — not in `schema.prisma`. This is a Prisma 7
  change.
- **Service layer:** Replaces the in-memory store from M05. Same interface, different
  implementation. The routes don't change — only the service.
- **Error mapping:** P2002 (unique) → 409, P2025 (not found) → 404, P2003 (foreign key) → 409.
  Mapped in the existing M05 error handler, not a new one.

## How to build it (teach it to the next trainee)

1. Install `prisma@7` and `@prisma/client@7`
2. Translate M06 schema to `schema.prisma`
3. `prisma migrate dev --name init` for initial migration
4. Add a second migration for `dueDate` or `priority`
5. Hand-edit one migration via `--create-only`
6. Build service layer on Prisma — replace in-memory store
7. Map Prisma errors to HTTP status codes in the existing error handler

## Concepts worth explaining

- **`migrate dev` vs `migrate deploy`:** `dev` is for development — creates migrations, applies
  them, resets if needed. `deploy` is for production — applies existing migrations only, never
  creates new ones.
- **Driver adapter:** Prisma 7 doesn't bundle a database driver — you provide one. The adapter
  handles the connection and query execution.

## What tripped me up

`better-sqlite3` native build on Windows — needed build tools installed first. Also the
`prisma7.config.ts` naming — the brief says it's `prisma.config.ts` on Prisma < 7.10, but
`prisma7.config.ts` on 7.10+. Confusing.

## Checkpoint evidence

- `migrate reset` + seed rebuilds the database from scratch, every time
- Bruno collection from M05 still green against v2
- Can explain `migrate dev` vs `migrate deploy`

## What I'd do differently

Use `@prisma/adapter-libsql` instead of `better-sqlite3` to avoid native build issues. Also
would have written the seed script before the service layer (needed data to test against).
