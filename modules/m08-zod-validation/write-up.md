# M08 Write-Up — Zod Validation & Type Inference

## What I built

Task API v3: all hand-written validation replaced by Zod schemas:
- `createTaskSchema` — for POST `/tasks` body
- `updateTaskSchema` — for PATCH `/tasks/:id` body
- `listQuerySchema` — for GET `/tasks` query params
- `paramsSchema` — for route params (`:id`)

Typed `validate` middleware, env validation in `config.ts`, handler types from `z.infer`.
No manual `if (!body.title)` checks remain.

## Why it's built this way (key decisions)

- **Zod as single source of truth:** Types are derived with `z.infer`, not written separately.
  This means the schema and the type can't drift apart.
- **`res.locals` for parsed values:** `req.query` is read-only in Express 5, so the `validate`
  middleware stores parsed values on `res.locals` instead of trying to reassign `req.query`.
- **Removed all hand-written validation:** The brief says "actually disappear, not just gain a
  Zod layer alongside it." I went through and deleted every `if (!body.title)` check.

## How to build it (teach it to the next trainee)

1. Write Zod schemas for create, update, list query, params
2. Build `validate({ body, params, query })` middleware — use `safeParse`, store on `res.locals`
3. Remove hand-written validation as you wire Zod in — not alongside it
4. Map `ZodError` to M05 envelope's `details` array
5. Add env validation in `config.ts` — fail fast on startup

## Concepts worth explaining

- **Runtime validation:** TypeScript types vanish at runtime. `req.body` is untrusted data.
  Zod validates at the boundary — before the data reaches your business logic.
- **`z.infer`:** Derive TypeScript types from Zod schemas. Schemas first, types derived. This
  means you write the schema once and get the type for free.

## What tripped me up

`req.query` is read-only in Express 5 — had to store parsed values on `res.locals`. Also the
Zod error format — `ZodError` has `issues` with `path` and `message`, but the M05 envelope
expects `details: [{ path, message }]`. Had to map between them.

## Checkpoint evidence

- v3 merged by PR
- No manual `if (!body.title)` checks remain — verified by grepping the codebase
- Invalid input never reaches Prisma — Zod schema rejects it first
- 400 responses carry field-level `details` in the exact M05 envelope shape

## What I'd do differently

Write the Zod schemas before the middleware (I did it the other way around). Also would have
used `z.coerce.number()` for query params earlier — query params are always strings, so
coercion is needed.
