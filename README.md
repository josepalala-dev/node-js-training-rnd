# Node.js Developer Training

This repo holds the Build-to-Teach version of the Node.js Developer Training Program: nine training
stages in `modules/` (M01–M09), followed by a capstone project. The format is different on purpose:
instead of being taught the material, the trainee builds toward each stage's deliverable from a
brief, and writes up how they did it as they go. The write-up is what ends up teaching the next
cohort.

A note on words: a **module** in this repository is a training stage, not a JavaScript/Node.js
module. Stages M02 and M03 are the ones that actually teach what a JavaScript/Node.js module is
(named vs default exports, ESM vs CommonJS).

## What is in this repository

| Path | What it holds |
| --- | --- |
| `modules/` | The nine stage folders (M01–M09), each with a brief, a checklist, and a write-up template |
| `modules/m10-capstone/` | The capstone, with its own brief, checklist, and write-up template |

## How a stage works

1. **Your trainer hands you the brief.** Each stage's `brief.md` says what to build and how you
   will know it is done: objective, scope, stack constraints, the named deliverable, a lab, a
   definition of done, and what to confirm with your trainer before you start. It contains no
   lesson, no steps, no code, and no solutions. How to build it is yours to work out.
2. **You build and write up the stage together.** Fill in `write-up-template.md` in the stage
   folder while you build, not after the build works. The lab's "you build and capture" section is
   your deliverable; your write-up is the teaching content — write it for someone who will follow
   it with no trainer to ask.
3. **Your trainer reviews both together.** When you reach the definition of done, bring both the
   working system and the write-up to your checkpoint. The question is not only "does it work?" but
   "could someone else learn from this?"
4. **You revise.** Fix what the review finds, in both the build and the write-up, before starting
   the next stage.
5. **The finished pair goes into the content library.** An accepted stage is the build plus its
   write-up. Your trainer decides what carries into the next cohort's plan.

Review happens at the end of every stage, not just at the end of the course.

## Why review as you go, not at the end

A write-up finished after the deliverable already works tends to be thin — there's no real
pressure to make it good once the thing runs. Reviewing both pieces together, stage by stage,
means the trainer is judging whether the work is teachable, not just whether it works, and catches
problems early instead of in a finished draft nobody wants to redo.

## What is in each stage folder

| File | Who writes it | Purpose |
| --- | --- | --- |
| `brief.md` | Your trainer | Objective, scope, stack constraints, the deliverable, a lab (goal, steps, what to capture), and definition of done. No answers. Do not edit it. |
| `write-up-template.md` | You | Blank at first; filled in as you build, not after. |
| `tasks.md` | Generated from `brief.md` via `/trainee-task-planner` | An ordered checklist mirroring the brief — setup, then research (M02–M09), then build (Day 3/4/5 for the M10 capstone), then verify, then write-up. You tick the boxes; it holds no answers and no steps you weren't already told. |

Your Node.js code lives outside this repository, in your own GitHub repo (the public training repo
you set up in M01). Link it from the header of your write-up. The capstone folder has the same
three files.

## Stages

| Stage | Title | Theme | Leaves behind |
| --- | --- | --- | --- |
| M01 | Dev Environment, Git & GitHub | Toolchain, the everyday Git workflow, a merged PR with a resolved conflict | Nothing |
| M02 | Modern JavaScript & Async/Await | Language essentials, the event loop, reliable async code | The Async toolkit (ported to TypeScript in M04) |
| M03 | Node.js Runtime & npm | Core modules, npm, a bare `node:http` server | Nothing |
| M04 | TypeScript Basics & TypeScript on Node.js | Strict TypeScript, the Task domain types | The ported toolkit and Task domain types |
| M05 | Express: Routing, Middleware & Error Handling | REST API structure, middleware, one consistent error model | Task API v1 (extended through M07–M09) |
| M06 | SQL Fundamentals with SQLite | Relational design, joins, transactions, SQL injection | The schema design (translated into Prisma in M07) |
| M07 | Prisma ORM & Migrations | Migrations, the typed client, Prisma error mapping | Task API v2 |
| M08 | Zod Validation & Type Inference | Runtime validation, type inference from schemas | Task API v3 |
| M09 | Integration Testing with Jest + Supertest | Real-database integration tests, CI | Task API v4 |
| M10 | Capstone Project | Independent API, authentication, a provable concurrency fix | — (terminal stage) |

Work the stages in order. Later stages build on earlier ones: M05's Task API carries forward
through M07, M08, and M09 (v1 → v4), and M06's schema design is what M07 translates into Prisma.
TypeScript (M04) comes before Express (M05) so the API is typed from the start; SQL (M06) comes
before Prisma (M07) so migrations aren't magic; hand-written validation (M05) comes before Zod
(M08) so the payoff is felt. Folder names are descriptive; each brief refers to other stages by
module ID (M01–M10).

---

## Training Learnings

**Compiled from M01–M09 write-ups.** This is what a trainee would have learned by going through
the full program.

### M01 — Dev Environment, Git & GitHub

**Skills:** Set up VS Code, Git, a Node version manager, and Bruno. Created a public GitHub repo.
Used the branch → PR → review → merge cycle. Wrote Conventional Commits. Resolved a deliberate
merge conflict with a partner.

**Key concepts:** Working tree → staging → commit. `git revert` (safe, new commit) vs `git reset`
(rewrites history). `.gitignore` conventions; `.env.example` over committing `.env`.

### M02 — Modern JavaScript & Async/Await

**Skills:** Wrote idiomatic ES2023+ JavaScript. Built async utilities (`sleep`, `retry`,
`withTimeout`, `mapLimit`) with `node:assert` self-checks. Compared sequential vs parallel fetch
timings. Refactored callback-style `node:fs` code to async/await.

**Key concepts:** Event loop (call stack → microtask queue → macrotask queue). `forEach(async)`
pitfall. `Promise.all`, `allSettled`, `race`, `any`. `AbortController` for cancellation.

### M03 — Node.js Runtime & npm

**Skills:** Used Node core modules (`node:fs/promises`, `node:stream`, `node:http`, `node:util`).
Built a streaming `log-report` CLI and a bare `node:http` server. Managed npm (package.json,
semver, lockfile, scripts, `npm audit`).

**Key concepts:** Streams for processing large files in chunks. Event loop (single-threaded,
non-blocking). ESM vs CommonJS. Debugging with `node --inspect` and VS Code.

### M04 — TypeScript Basics & TypeScript on Node.js

**Skills:** Ported the M02 toolkit to TypeScript with generics. Modeled Task domain types (`Task`,
`CreateTaskInput`, `UpdateTaskInput`, `Result<T, E>`). Set up strict `tsconfig.json`. Ran TypeScript
three ways: `tsx`, native type stripping, `tsc` build.

**Key concepts:** `unknown` vs `any`. `type` vs `interface`. `Result<T, E>` as a discriminated
union. Generics, utility types, narrowing. `erasableSyntaxOnly` (no enums, no parameter properties).

### M05 — Express: Routing, Middleware & Error Handling

**Skills:** Built an in-memory Express REST API (Task API v1). Separated `app.ts` from `server.ts`.
Built an `AppError` hierarchy and central error handler. Built request-ID and logging middleware.
Wrote five `/api/v1/tasks` endpoints with hand-written validation. Built a Bruno collection.

**Key concepts:** Express 5 forwards rejected promises to the error handler automatically.
Middleware order matters. Fixed error envelope: `{ error: { code, message, details?, requestId } }`.
`helmet`, `cors`, `pino-http`. Graceful shutdown on `SIGTERM`.

### M06 — SQL Fundamentals with SQLite

**Skills:** Designed a `users`/`tasks`/`tags`/`task_tags` schema with a junction table for M:N.
Wrote DDL with primary keys, foreign keys, constraints, indexes. Wrote 20+ self-directed query
exercises. Drew a Mermaid ERD. Demonstrated SQL injection and the parameterised fix.

**Key concepts:** Primary vs foreign keys. `ON DELETE CASCADE`. Indexes and `EXPLAIN QUERY PLAN`.
SQL injection prevention with parameterized queries. Transactions (`BEGIN`/`COMMIT`/`ROLLBACK`).

### M07 — Prisma ORM & Migrations

**Skills:** Translated the M06 schema into Prisma 7. Created 2+ migrations (one hand-edited).
Built a service layer replacing the in-memory store. Implemented filtered/sorted/paginated listing.
Wrote an idempotent seed script. Mapped Prisma error codes to HTTP status (P2002 → 409,
P2025 → 404, P2003 → 409).

**Key concepts:** Prisma 7 requires a driver adapter. Datasource URL in `prisma7.config.ts`.
`migrate dev` (development) vs `migrate deploy` (production). Never edit an applied migration.

### M08 — Zod Validation & Type Inference

**Skills:** Replaced all hand-written validation with Zod 4 schemas. Built a typed `validate`
middleware. Worked around `req.query` being read-only in Express 5 (stored on `res.locals`).
Mapped `ZodError` to the M05 envelope's `details` array. Added env validation in `config.ts`.

**Key concepts:** Runtime validation (TypeScript types vanish at runtime). `z.infer` for type
derivation. Zod + Prisma: Zod is the request contract, Prisma types are the persistence contract.
`z.coerce.number()` for query params.

### M09 — Integration Testing with Jest + Supertest

**Skills:** Set up Jest 30 with `@swc/jest` in ESM mode. Used a test database strategy (separate
`test.db`, `globalSetup`, `beforeEach` cleanup). Wrote 25+ integration tests. Added
`PATCH /tasks/:id/complete` test-first. Set up GitHub Actions CI. Achieved 80%+ coverage.

**Key concepts:** Integration tests use the real app and real database — no mocking the database.
`@swc/jest` strips types; `tsc --noEmit` is the type gate. `--runInBand` (SQLite single writer).
`--randomize` (random order — if it fails, there's an isolation bug).

### Program-Level Learnings

**Dependency chain:**

```
M01 (toolchain + Git workflow)
  └─ M02 (modern JavaScript, async/await)
       └─ M03 (Node.js runtime, npm)
            └─ M04 (TypeScript)
                 └─ M05 (Express, Task API v1)
                      ├─ M06 (SQL, schema design)
                      │    └─ M07 (Prisma, Task API v2)
                      │         └─ M08 (Zod, Task API v3)
                      │              └─ M09 (Testing, Task API v4)
```

**Cross-cutting skills:** Git/GitHub workflow, consistent error handling, Zod validation,
integration testing with a real database, CI with GitHub Actions, documentation (Mermaid ERD,
README, endpoint list).

**Tools used across the program:**

| Tool | Modules |
| --- | --- |
| Git + GitHub | All |
| Node.js 24 LTS | All |
| TypeScript 7 | M04–M09 |
| Express 5 | M05, M07, M08, M09 |
| Prisma 7 + SQLite | M07, M08, M09 |
| Zod 4 | M08, M09 |
| Jest 30 + Supertest 7 | M09 |
| Bruno | M05, M07 |
| pino-http | M05, M07, M08 |
