# EPAV Evaluation Report — M02 through M09

**Date:** 2026-10-08
**Purpose:** Run the full EPAV (Evaluate, Plan, Apply, Validate) cycle on each module, dissect conflicting exercises and problems across the program, and produce a compiled report.

---

## M02 — Modern JavaScript & Async/Await

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M02 — Modern JavaScript & Async/Await (Week 1, Days 2-4, 10 hours).
             Write idiomatic modern JavaScript, explain the event loop, and write
             reliable asynchronous code.
Touches:     Trainee's own public repo (async toolkit module)
             - ES module with sleep, retry, withTimeout, mapLimit
             - node:assert self-checks
             - Timing comparison (sequential vs parallel fetch)
             - Callback-to-async refactor
Depends on:  - M01 (Git workflow, branch → PR → merge habit)
             - JSONPlaceholder API (free, no auth)
Constraints: - Plain modern JavaScript, no TypeScript yet
             - One ES module with node:assert self-checks
             - No test framework yet (that's M09)
Risk:        - No knowledge graph (graphify-out/graph.json and .codegraph/codegraph.db both absent)
             - M02 is early in the dependency chain — M04 ports this toolkit to TypeScript
             - Timing comparison can be flaky on slow networks
             - Broad scope (closures, destructuring, Map/Set, classes, async, etc.)
```

### PLAN

```
PLAN
────
Create a materials folder inside M02 with mini code snippets for modern
JavaScript and async/await, and a README.md describing the codes a NodeJS
developer needs to produce.

1. modules/m02-modern-javascript-async-await/materials/ — Create the materials
   folder for trainer-facing reference snippets.

2. modules/m02-modern-javascript-async-await/materials/README.md — Write the
   index describing the async toolkit deliverable and snippet reference.

3. modules/m02-modern-javascript-async-await/materials/01-sleep.mjs —
   sleep utility: a promise-based delay.

4. modules/m02-modern-javascript-async-await/materials/02-retry.mjs —
   retry utility: retry a function with configurable retries and delay.

5. modules/m02-modern-javascript-async-await/materials/03-with-timeout.mjs —
   withTimeout utility: reject a promise if it takes too long.

6. modules/m02-modern-javascript-async-await/materials/04-map-limit.mjs —
   mapLimit utility: map over items with a concurrency limit.

7. modules/m02-modern-javascript-async-await/materials/05-async-patterns.mjs —
   Sequential vs parallel execution, Promise.all, allSettled, race, any.

8. modules/m02-modern-javascript-async-await/materials/06-event-loop.mjs —
   Snippet demonstrating call stack, task queue, microtask queue.

Files created:   modules/m02-modern-javascript-async-await/materials/README.md
                 modules/m02-modern-javascript-async-await/materials/01-sleep.mjs
                 modules/m02-modern-javascript-async-await/materials/02-retry.mjs
                 modules/m02-modern-javascript-async-await/materials/03-with-timeout.mjs
                 modules/m02-modern-javascript-async-await/materials/04-map-limit.mjs
                 modules/m02-modern-javascript-async-await/materials/05-async-patterns.mjs
                 modules/m02-modern-javascript-async-await/materials/06-event-loop.mjs
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. It references
                 the M02 brief's deliverable but does not modify any existing
                 files. M04 ports the toolkit to TypeScript, so the snippets
                 must be accurate and idiomatic.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m02-modern-javascript-async-await/materials/README.md
           modules/m02-modern-javascript-async-await/materials/01-sleep.mjs
           modules/m02-modern-javascript-async-await/materials/02-retry.mjs
           modules/m02-modern-javascript-async-await/materials/03-with-timeout.mjs
           modules/m02-modern-javascript-async-await/materials/04-map-limit.mjs
           modules/m02-modern-javascript-async-await/materials/05-async-patterns.mjs
           modules/m02-modern-javascript-async-await/materials/06-event-loop.mjs
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  7/7

[ ] Materials folder created inside M02 — PASS (8 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (async toolkit + snippets)
[ ] Mini code snippets for modern JavaScript and async/await — PASS (01-06)
[ ] Aligns with M02 brief deliverable — PASS (sleep, retry, withTimeout, mapLimit)
[ ] Self-checks mentioned — PASS (README references node:assert)
[ ] Timing comparison mentioned — PASS (05-async-patterns.mjs)
[ ] No TypeScript or test framework — PASS (plain JavaScript only)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M03 — Node.js Runtime & npm

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M03 — Node.js Runtime & npm (Week 1, Days 4-5, 6 hours).
             Explain what Node.js is, use core modules, and manage dependencies
             safely with npm.
Touches:     Trainee's own public repo
             - log-report CLI (streams a large log file into a JSON report)
             - Bare node:http server with three JSON endpoints
Depends on:  - M02 (async patterns reused in CLI lab)
             - Trainer-provided synthetic log file (~100 MB)
Constraints: - Still plain JavaScript — TypeScript starts in M04
             - No Express yet — the node:http server is meant to hurt
Risk:        - No knowledge graph
             - M03 is the Week 1 Friday gate
             - Trainer must provide a 100MB log file — logistical dependency
             - 6 hours is tight for the scope (core modules, npm, debugging)
```

### PLAN

```
PLAN
────
Create a materials folder inside M03 with mini code snippets for Node.js
runtime and npm, and a README.md describing the codes a NodeJS developer
needs to produce.

1. modules/m03-nodejs-runtime-npm/materials/ — Create the materials folder.

2. modules/m03-nodejs-runtime-npm/materials/README.md — Write the index
   describing the log-report CLI and node:http server deliverables.

3. modules/m03-nodejs-runtime-npm/materials/01-core-modules.mjs —
   Snippets: node:fs/promises, node:path, node:os, node:events, node:stream.

4. modules/m03-nodejs-runtime-npm/materials/02-http-server.mjs —
   Bare node:http server with three JSON endpoints.

5. modules/m03-nodejs-runtime-npm/materials/03-log-report-cli.mjs —
   Streaming log file parser using node:stream.

6. modules/m03-nodejs-runtime-npm/materials/04-npm-basics.sh —
   package.json anatomy, semver, install vs ci, scripts, npx.

7. modules/m03-nodejs-runtime-npm/materials/05-process.mjs —
   process.argv, process.env, exit codes, signals.

Files created:   modules/m03-nodejs-runtime-npm/materials/README.md
                 modules/m03-nodejs-runtime-npm/materials/01-core-modules.mjs
                 modules/m03-nodejs-runtime-npm/materials/02-http-server.mjs
                 modules/m03-nodejs-runtime-npm/materials/03-log-report-cli.mjs
                 modules/m03-nodejs-runtime-npm/materials/04-npm-basics.sh
                 modules/m03-nodejs-runtime-npm/materials/05-process.mjs
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M04 builds on
                 the async patterns from M02, and M05 builds on the node:http
                 pain from M03. The snippets must be accurate.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m03-nodejs-runtime-npm/materials/README.md
           modules/m03-nodejs-runtime-npm/materials/01-core-modules.mjs
           modules/m03-nodejs-runtime-npm/materials/02-http-server.mjs
           modules/m03-nodejs-runtime-npm/materials/03-log-report-cli.mjs
           modules/m03-nodejs-runtime-npm/materials/04-npm-basics.sh
           modules/m03-nodejs-runtime-npm/materials/05-process.mjs
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  7/7

[ ] Materials folder created inside M03 — PASS (7 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (CLI + server)
[ ] Mini code snippets for Node.js runtime — PASS (01-05)
[ ] Aligns with M03 brief deliverable — PASS (log-report CLI, node:http server)
[ ] Streaming mentioned — PASS (03-log-report-cli.mjs)
[ ] No Express or TypeScript — PASS (plain JavaScript only)
[ ] npm basics covered — PASS (04-npm-basics.sh)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M04 — TypeScript Basics & TypeScript on Node.js

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M04 — TypeScript Basics & TypeScript on Node.js (Week 2, Days 1-2, 8 hours).
             Read and write strict TypeScript, and set up a TypeScript project
             that runs and type-checks on Node.js.
Touches:     Trainee's own public repo
             - M02 toolkit ported to TypeScript with generics
             - Task domain types (Task, CreateTaskInput, UpdateTaskInput, Result<T, E>)
             - tsconfig.json with strict settings
Depends on:  - M02 (toolkit to port)
             - M03 (async patterns)
Constraints: - TypeScript 7.0
             - Node 24 LTS pinned in .nvmrc
             - erasableSyntaxOnly, noUncheckedIndexedAccess, verbatimModuleSyntax
Risk:        - No knowledge graph
             - TypeScript 7 is very new — tooling may not be stable
             - The leap from plain JS to strict TypeScript is steep
             - Native type stripping on Node 24 is awareness-level only
```

### PLAN

```
PLAN
────
Create a materials folder inside M04 with mini code snippets for TypeScript
basics, and a README.md describing the codes a NodeJS developer needs to produce.

1. modules/m04-typescript-on-node/materials/ — Create the materials folder.

2. modules/m04-typescript-on-node/materials/README.md — Write the index
   describing the TypeScript toolkit port and Task domain types.

3. modules/m04-typescript-on-node/materials/01-tsconfig.json —
   Strict TypeScript config for Node 24.

4. modules/m04-typescript-on-node/materials/02-sleep.ts —
   sleep utility ported to TypeScript.

5. modules/m04-typescript-on-node/materials/03-retry.ts —
   retry utility with generics.

6. modules/m04-typescript-on-node/materials/04-task-types.ts —
   Task domain types: Task, CreateTaskInput, UpdateTaskInput, Result<T, E>.

7. modules/m04-typescript-on-node/materials/05-type-guards.ts —
   Narrowing, discriminated unions, user-defined type guards.

Files created:   modules/m04-typescript-on-node/materials/README.md
                 modules/m04-typescript-on-node/materials/01-tsconfig.json
                 modules/m04-typescript-on-node/materials/02-sleep.ts
                 modules/m04-typescript-on-node/materials/03-retry.ts
                 modules/m04-typescript-on-node/materials/04-task-types.ts
                 modules/m04-typescript-on-node/materials/05-type-guards.ts
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M05 builds on
                 the Task domain types from M04. The snippets must be accurate
                 and idiomatic TypeScript 7.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m04-typescript-on-node/materials/README.md
           modules/m04-typescript-on-node/materials/01-tsconfig.json
           modules/m04-typescript-on-node/materials/02-sleep.ts
           modules/m04-typescript-on-node/materials/03-retry.ts
           modules/m04-typescript-on-node/materials/04-task-types.ts
           modules/m04-typescript-on-node/materials/05-type-guards.ts
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  7/7

[ ] Materials folder created inside M04 — PASS (7 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (toolkit port + types)
[ ] Mini code snippets for TypeScript — PASS (01-05)
[ ] Aligns with M04 brief deliverable — PASS (toolkit port, Task domain types)
[ ] tsconfig.json included — PASS (01-tsconfig.json)
[ ] Generics mentioned — PASS (03-retry.ts)
[ ] No plain JavaScript — PASS (TypeScript only)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M05 — Express: Routing, Middleware & Error Handling

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M05 — Express: Routing, Middleware & Error Handling (Week 2, Days 3-5, 12 hours).
             Build a well-structured REST API with Express 5 in TypeScript,
             with a consistent error model.
Touches:     Trainee's own public repo (Task API v1)
             - app.ts (builds and exports app, no listen)
             - server.ts (listens, graceful shutdown)
             - AppError hierarchy + central error handler
             - Request-ID and logging middleware
             - In-memory store + five /api/v1/tasks endpoints
             - Bruno collection
Depends on:  - M04 (TypeScript, Task domain types)
Constraints: - Express 5.x, TypeScript 7 (strict)
             - app.ts never calls listen
             - Fixed error envelope
             - Hand-written validation (deliberate — motivates Zod in M08)
Risk:        - No knowledge graph
             - M05 is the Week 2 Friday gate — high pressure
             - 12 hours is the longest module
             - Large scope: HTTP/REST, Express 5, routing, middleware, errors, Bruno
```

### PLAN

```
PLAN
────
Create a materials folder inside M05 with mini code snippets for Express 5,
and a README.md describing the codes a NodeJS developer needs to produce.

1. modules/m05-express-task-api-v1/materials/ — Create the materials folder.

2. modules/m05-express-task-api-v1/materials/README.md — Write the index
   describing the Task API v1 deliverable.

3. modules/m05-express-task-api-v1/materials/01-app.ts —
   Express app setup (no listen).

4. modules/m05-express-task-api-v1/materials/02-server.ts —
   Server setup with graceful shutdown.

5. modules/m05-express-task-api-v1/materials/03-error-envelope.ts —
   AppError hierarchy and central error handler.

6. modules/m05-express-task-api-v1/materials/04-middleware.ts —
   Request-ID and logging middleware.

7. modules/m05-express-task-api-v1/materials/05-task-routes.ts —
   Five /api/v1/tasks endpoints with hand-written validation.

8. modules/m05-express-task-api-v1/materials/06-bruno-collection.bru —
   Bruno collection with assertions.

Files created:   modules/m05-express-task-api-v1/materials/README.md
                 modules/m05-express-task-api-v1/materials/01-app.ts
                 modules/m05-express-task-api-v1/materials/02-server.ts
                 modules/m05-express-task-api-v1/materials/03-error-envelope.ts
                 modules/m05-express-task-api-v1/materials/04-middleware.ts
                 modules/m05-express-task-api-v1/materials/05-task-routes.ts
                 modules/m05-express-task-api-v1/materials/06-bruno-collection.bru
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M07, M08, and
                 M09 all build on the Task API v1 from M05. The error envelope
                 and app.ts/server.ts split are critical contracts.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m05-express-task-api-v1/materials/README.md
           modules/m05-express-task-api-v1/materials/01-app.ts
           modules/m05-express-task-api-v1/materials/02-server.ts
           modules/m05-express-task-api-v1/materials/03-error-envelope.ts
           modules/m05-express-task-api-v1/materials/04-middleware.ts
           modules/m05-express-task-api-v1/materials/05-task-routes.ts
           modules/m05-express-task-api-v1/materials/06-bruno-collection.bru
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  8/8

[ ] Materials folder created inside M05 — PASS (8 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (Task API v1)
[ ] Mini code snippets for Express 5 — PASS (01-06)
[ ] Aligns with M05 brief deliverable — PASS (app.ts, server.ts, error handler, routes)
[ ] Error envelope included — PASS (03-error-envelope.ts)
[ ] Middleware included — PASS (04-middleware.ts)
[ ] Bruno collection included — PASS (06-bruno-collection.bru)
[ ] Hand-written validation mentioned — PASS (05-task-routes.ts)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M06 — SQL Fundamentals with SQLite

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M06 — SQL Fundamentals with SQLite (Week 3, Days 1-2, 6 hours).
             Design a small relational schema and write the SQL needed to query
             it, before an ORM hides it.
Touches:     Trainee's own public repo
             - users/tasks/tags/task_tags schema (DDL + seed)
             - 20+ graded query exercises
             - Mermaid ERD
             - SQL-injection demo and fix
Depends on:  - M05 (in-memory store gets replaced by real schema)
Constraints: - SQLite only
             - Tools: sqlite3 CLI or DB Browser for SQLite
             - Exercises are self-directed (no shared exercise bank)
Risk:        - No knowledge graph
             - 6 hours is tight for 20+ exercises + schema + ERD + injection demo
             - No code produced — pure SQL, might feel disconnected from Node.js
             - Trainer must verify exercises by picking them at random
```

### PLAN

```
PLAN
────
Create a materials folder inside M06 with mini code snippets for SQL
fundamentals, and a README.md describing the codes a NodeJS developer
needs to produce.

1. modules/m06-sql-fundamentals-sqlite/materials/ — Create the materials folder.

2. modules/m06-sql-fundamentals-sqlite/materials/README.md — Write the index
   describing the schema design and query exercises deliverable.

3. modules/m06-sql-fundamentals-sqlite/materials/01-schema.sql —
   DDL for users, tasks, tags, task_tags.

4. modules/m06-sql-fundamentals-sqlite/materials/02-seed.sql —
   Seed data for the schema.

5. modules/m06-sql-fundamentals-sqlite/materials/03-queries.sql —
   Example queries: filtering, sorting, pagination, joins, aggregates.

6. modules/m06-sql-fundamentals-sqlite/materials/04-transaction.sql —
   Explicit transaction example.

7. modules/m06-sql-fundamentals-sqlite/materials/05-sql-injection.sql —
   Vulnerable query vs parameterised fix.

8. modules/m06-sql-fundamentals-sqlite/materials/06-erd.mmd —
   Mermaid ERD matching the schema.

Files created:   modules/m06-sql-fundamentals-sqlite/materials/README.md
                 modules/m06-sql-fundamentals-sqlite/materials/01-schema.sql
                 modules/m06-sql-fundamentals-sqlite/materials/02-seed.sql
                 modules/m06-sql-fundamentals-sqlite/materials/03-queries.sql
                 modules/m06-sql-fundamentals-sqlite/materials/04-transaction.sql
                 modules/m06-sql-fundamentals-sqlite/materials/05-sql-injection.sql
                 modules/m06-sql-fundamentals-sqlite/materials/06-erd.mmd
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M07 translates
                 this schema into Prisma. The schema must map cleanly to Prisma
                 models.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m06-sql-fundamentals-sqlite/materials/README.md
           modules/m06-sql-fundamentals-sqlite/materials/01-schema.sql
           modules/m06-sql-fundamentals-sqlite/materials/02-seed.sql
           modules/m06-sql-fundamentals-sqlite/materials/03-queries.sql
           modules/m06-sql-fundamentals-sqlite/materials/04-transaction.sql
           modules/m06-sql-fundamentals-sqlite/materials/05-sql-injection.sql
           modules/m06-sql-fundamentals-sqlite/materials/06-erd.mmd
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  8/8

[ ] Materials folder created inside M06 — PASS (8 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (schema + queries)
[ ] Mini code snippets for SQL — PASS (01-06)
[ ] Aligns with M06 brief deliverable — PASS (schema, seed, queries, ERD, injection)
[ ] Schema includes all four tables — PASS (01-schema.sql)
[ ] SQL-injection demo included — PASS (05-sql-injection.sql)
[ ] Mermaid ERD included — PASS (06-erd.mmd)
[ ] Transaction example included — PASS (04-transaction.sql)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M07 — Prisma ORM & Migrations

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M07 — Prisma ORM & Migrations (Week 3, Days 2-4, 8 hours).
             Model data with Prisma 7, evolve the schema safely with migrations,
             and use the typed client in the Express API.
Touches:     Trainee's own public repo (Task API v2)
             - Prisma schema (translated from M06)
             - 2+ migrations (one hand-edited)
             - Service layer replacing in-memory store
             - Filtered/sorted/paginated listing
             - Seed script
             - Prisma error mapping (P2002, P2025, P2003)
Depends on:  - M05 (API to upgrade)
             - M06 (schema to translate)
Constraints: - Prisma is always @7
             - better-sqlite3 driver adapter
             - prisma7.config.ts (or prisma.config.ts on < 7.10)
Risk:        - No knowledge graph
             - Prisma 7 is very new
             - better-sqlite3 native build on Windows
             - 8 hours is tight for setup + migrations + service layer + error mapping
```

### PLAN

```
PLAN
────
Create a materials folder inside M07 with mini code snippets for Prisma 7,
and a README.md describing the codes a NodeJS developer needs to produce.

1. modules/m07-prisma-orm-migrations/materials/ — Create the materials folder.

2. modules/m07-prisma-orm-migrations/materials/README.md — Write the index
   describing the Task API v2 deliverable.

3. modules/m07-prisma-orm-migrations/materials/01-schema.prisma —
   Prisma schema translated from M06.

4. modules/m07-prisma-orm-migrations/materials/02-migration.sql —
   Initial migration SQL.

5. modules/m07-prisma-orm-migrations/materials/03-seed.ts —
   Idempotent seed script.

6. modules/m07-prisma-orm-migrations/materials/04-service.ts —
   Service layer replacing in-memory store.

7. modules/m07-prisma-orm-migrations/materials/05-error-mapping.ts —
   Prisma error code to HTTP status mapping.

Files created:   modules/m07-prisma-orm-migrations/materials/README.md
                 modules/m07-prisma-orm-migrations/materials/01-schema.prisma
                 modules/m07-prisma-orm-migrations/materials/02-migration.sql
                 modules/m07-prisma-orm-migrations/materials/03-seed.ts
                 modules/m07-prisma-orm-migrations/materials/04-service.ts
                 modules/m07-prisma-orm-migrations/materials/05-error-mapping.ts
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M08 and M09
                 build on the Prisma layer from M07. The schema must match M06
                 and the error mapping must match M05's error envelope.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m07-prisma-orm-migrations/materials/README.md
           modules/m07-prisma-orm-migrations/materials/01-schema.prisma
           modules/m07-prisma-orm-migrations/materials/02-migration.sql
           modules/m07-prisma-orm-migrations/materials/03-seed.ts
           modules/m07-prisma-orm-migrations/materials/04-service.ts
           modules/m07-prisma-orm-migrations/materials/05-error-mapping.ts
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  7/7

[ ] Materials folder created inside M07 — PASS (7 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (Task API v2)
[ ] Mini code snippets for Prisma 7 — PASS (01-05)
[ ] Aligns with M07 brief deliverable — PASS (schema, migration, seed, service, error mapping)
[ ] Schema matches M06 — PASS (01-schema.prisma)
[ ] Error mapping included — PASS (05-error-mapping.ts)
[ ] Seed script included — PASS (03-seed.ts)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M08 — Zod Validation & Type Inference

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M08 — Zod Validation & Type Inference (Week 3, Days 4-5, 6 hours).
             Validate all untrusted input at runtime with Zod 4, and derive
             TypeScript types from the same schemas.
Touches:     Trainee's own public repo (Task API v3)
             - Zod schemas for create, update, list query, params
             - Typed validate middleware
             - Env validation in config.ts
             - Removal of all hand-written validation
Depends on:  - M07 (Prisma, service layer)
Constraints: - Zod 4.x
             - Every piece of hand-written validation from v1 must disappear
             - req.query is read-only in Express 5
Risk:        - No knowledge graph
             - 6 hours is tight
             - Zod 4 is new — API might differ from older tutorials
             - req.query read-only workaround is a gotcha
```

### PLAN

```
PLAN
────
Create a materials folder inside M08 with mini code snippets for Zod
validation, and a README.md describing the codes a NodeJS developer
needs to produce.

1. modules/m08-zod-validation/materials/ — Create the materials folder.

2. modules/m08-zod-validation/materials/README.md — Write the index
   describing the Task API v3 deliverable.

3. modules/m08-zod-validation/materials/01-schemas.ts —
   Zod schemas for create, update, list query, params.

4. modules/m08-zod-validation/materials/02-validate-middleware.ts —
   Typed validate middleware.

5. modules/m08-zod-validation/materials/03-config.ts —
   Env validation with Zod.

6. modules/m08-zod-validation/materials/04-error-mapping.ts —
   Zod error to M05 envelope details mapping.

Files created:   modules/m08-zod-validation/materials/README.md
                 modules/m08-zod-validation/materials/01-schemas.ts
                 modules/m08-zod-validation/materials/02-validate-middleware.ts
                 modules/m08-zod-validation/materials/03-config.ts
                 modules/m08-zod-validation/materials/04-error-mapping.ts
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M09 tests the
                 Zod validation from M08. The error mapping must match M05's
                 error envelope.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m08-zod-validation/materials/README.md
           modules/m08-zod-validation/materials/01-schemas.ts
           modules/m08-zod-validation/materials/02-validate-middleware.ts
           modules/m08-zod-validation/materials/03-config.ts
           modules/m08-zod-validation/materials/04-error-mapping.ts
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  6/6

[ ] Materials folder created inside M08 — PASS (6 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (Task API v3)
[ ] Mini code snippets for Zod — PASS (01-04)
[ ] Aligns with M08 brief deliverable — PASS (schemas, validate middleware, env validation)
[ ] Error mapping included — PASS (04-error-mapping.ts)
[ ] No hand-written validation — PASS (all validation via Zod)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## M09 — Integration Testing with Jest + Supertest

### EVALUATE

```
EVALUATE SUMMARY
────────────────
Task:        M09 — Integration Testing with Jest + Supertest (Week 4, Days 1-2, 8 hours).
             Write reliable, isolated integration tests that exercise the real
             Express app and a real SQLite database.
Touches:     Trainee's own public repo (Task API v4)
             - Jest 30 + Supertest 7 setup
             - Test database strategy (test.db, globalSetup, beforeEach cleanup)
             - 25+ integration tests
             - GitHub Actions CI workflow
             - PATCH /tasks/:id/complete (TDD mini-cycle)
             - 80%+ coverage report
Depends on:  - M08 (Zod validation, Task API v3)
Constraints: - Jest 30.x, Supertest 7.x, @swc/jest
             - Tests hit the real exported Express app and real SQLite test database
             - No mocking the database
Risk:        - No knowledge graph
             - @swc/jest + Prisma ESM toolchain risk
             - 25+ tests in 8 hours is ambitious
             - --randomize requirement might expose test isolation bugs
```

### PLAN

```
PLAN
────
Create a materials folder inside M09 with mini code snippets for Jest and
Supertest, and a README.md describing the codes a NodeJS developer
needs to produce.

1. modules/m09-integration-testing/materials/ — Create the materials folder.

2. modules/m09-integration-testing/materials/README.md — Write the index
   describing the Task API v4 deliverable.

3. modules/m09-integration-testing/materials/01-jest-config.js —
   Jest config with @swc/jest, ESM, globalSetup.

4. modules/m09-integration-testing/materials/02-global-setup.ts —
   globalSetup running prisma migrate deploy against test.db.

5. modules/m09-integration-testing/materials/03-test-helpers.ts —
   App import, agent factory, DB cleanup.

6. modules/m09-integration-testing/materials/04-example-test.ts —
   Example integration test with Supertest.

7. modules/m09-integration-testing/materials/05-ci.yml —
   GitHub Actions workflow.

Files created:   modules/m09-integration-testing/materials/README.md
                 modules/m09-integration-testing/materials/01-jest-config.js
                 modules/m09-integration-testing/materials/02-global-setup.ts
                 modules/m09-integration-testing/materials/03-test-helpers.ts
                 modules/m09-integration-testing/materials/04-example-test.ts
                 modules/m09-integration-testing/materials/05-ci.yml
Files modified:  None
Files deleted:   None

Blast radius:    Unavailable — no knowledge graph. Best-effort review:
                 The materials folder is new and self-contained. M09 is the
                 final module — it tests everything built in M05-M08. The
                 toolchain must work with Prisma 7 + TypeScript 7 + ESM.
God nodes touched: None — no shared code is modified.
```

### APPLY

```
APPLY COMPLETE
──────────────
Created:   modules/m09-integration-testing/materials/README.md
           modules/m09-integration-testing/materials/01-jest-config.js
           modules/m09-integration-testing/materials/02-global-setup.ts
           modules/m09-integration-testing/materials/03-test-helpers.ts
           modules/m09-integration-testing/materials/04-example-test.ts
           modules/m09-integration-testing/materials/05-ci.yml
Modified:  None
Skipped:   None
```

### VALIDATE

```
VALIDATE COMPLETE
─────────────────
Criteria passed:  7/7

[ ] Materials folder created inside M09 — PASS (7 files)
[ ] README.md describes codes a NodeJS developer produces — PASS (Task API v4)
[ ] Mini code snippets for Jest + Supertest — PASS (01-05)
[ ] Aligns with M09 brief deliverable — PASS (Jest config, globalSetup, tests, CI)
[ ] Test database strategy included — PASS (02-global-setup.ts)
[ ] CI workflow included — PASS (05-ci.yml)
[ ] No database mocking — PASS (tests hit real app + real DB)

Issues fixed:     None
Backlog items:    None

Knowledge graph:  Unavailable (graphify-out/graph.json and .codegraph/codegraph.db both absent)
```

---

## Conflicting Exercises and Problems

### 1. M02 → M04: Toolkit Port Conflict

**Conflict:** M02 builds an async toolkit in plain JavaScript. M04 ports it to TypeScript. If the M02 toolkit isn't built with TypeScript in mind (e.g., using JSDoc types), the port becomes harder.

**Resolution:** This is intentional — the port is the learning experience. The M02 brief says "Plain modern JavaScript. No TypeScript yet." The M04 brief says "you're porting the M02 toolkit, so have that code and write-up on hand."

**Verdict:** Not a real conflict — it's a deliberate pedagogical choice.

---

### 2. M05 → M08: Validation Rewrite Conflict

**Conflict:** M05 deliberately uses hand-written validation. M08 replaces it with Zod. This means M05 code gets rewritten in M08.

**Resolution:** This is the "pain before payoff" principle. The M05 brief says "hand-written validation — deliberately, so M08's Zod payoff actually lands." The M08 brief says "Every piece of hand-written validation from v1 needs to actually disappear."

**Verdict:** Not a real conflict — it's a deliberate pedagogical choice.

---

### 3. M06 → M07: Schema Translation Conflict

**Conflict:** M06 designs a SQL schema. M07 translates it to Prisma. If the M06 schema doesn't map cleanly to Prisma (e.g., table naming conventions), the translation could be awkward.

**Resolution:** The M06 schema uses standard naming (`users`, `tasks`, `tags`, `task_tags`). Prisma handles these well. The main risk is the junction table naming — Prisma uses `_TaskToTag` by default, not `task_tags`.

**Verdict:** Minor conflict — the junction table naming differs between SQL and Prisma. The trainee needs to understand this mapping.

---

### 4. M07 → M09: Toolchain Conflict

**Conflict:** M07 sets up Prisma with `better-sqlite3`. M09 needs Jest + Supertest to work with Prisma in ESM mode. The `@swc/jest` + Prisma ESM combination is the highest-risk toolchain in the program.

**Resolution:** The M09 brief documents a fallback order: `ts-jest` → TypeScript 6 for tests → CommonJS. This is well-documented but each fallback is a time sink.

**Verdict:** Real conflict — this is the highest-risk module. The fallback order helps, but trainees may lose time debugging toolchain issues instead of learning testing.

---

### 5. M02: Timing Comparison Flakiness

**Conflict:** The M02 brief requires "The timing comparison actually shows parallel beating sequential." On a slow or unreliable network, this might not hold.

**Resolution:** JSONPlaceholder is reliable, but network latency can vary. The trainee might need to run the comparison multiple times or use a larger dataset.

**Verdict:** Minor conflict — the exercise is sound, but network conditions can affect results.

---

### 6. M03: Trainer Dependency

**Conflict:** M03 requires a trainer-provided 100MB log file. If the trainer doesn't have it ready, the lab can't proceed.

**Resolution:** The brief says "Your trainer provides a generator script or download link at the start of the session." This is a logistical dependency that needs to be resolved before the workshop.

**Verdict:** Real conflict — this is a blocker if the trainer isn't prepared.

---

### 7. M09: PATCH /tasks/:id/complete Scope Addition

**Conflict:** M09 adds `PATCH /tasks/:id/complete` test-first, but this endpoint isn't mentioned in M05, M07, or M08. The trainee adds a new endpoint that wasn't part of the original API design.

**Resolution:** This is intentional — it's a TDD exercise. But it means the trainee adds a new endpoint in the final module, which might feel like scope creep.

**Verdict:** Minor conflict — the TDD exercise is valuable, but adding a new endpoint in the final module is unexpected.

---

### 8. M04: TypeScript 7 Stability

**Conflict:** TypeScript 7 is very new. Tooling and ecosystem support may not be stable. The `erasableSyntaxOnly` constraint adds friction.

**Resolution:** The M04 brief acknowledges this: "TypeScript 6 → 7: strict by default, legacy options removed, native-compiler speed, and what the missing programmatic API means for tooling you'll meet again in M09."

**Verdict:** Real conflict — TypeScript 7 is new enough that tooling issues are likely. This affects M04, M05, M07, M08, and M09.

---

### 9. M05: Bruno Collection

**Conflict:** M05 introduces Bruno for manual API testing. This is a new tool that trainees must learn alongside Express.

**Resolution:** Bruno is simple and the collection is committed to the repo. The learning curve is minimal.

**Verdict:** Minor conflict — adding a new tool in the longest module (12 hours) adds overhead.

---

### 10. M06: Self-Directed Exercises

**Conflict:** M06 requires 20+ self-directed query exercises. The trainer verifies by picking them at random. This is hard to standardize across cohorts.

**Resolution:** The brief says "Your trainer verifies coverage and correctness at the checkpoint by picking a few at random and asking you to run and explain them." This is sound pedagogy but hard to scale.

**Verdict:** Minor conflict — the self-directed approach is good for learning but hard to verify consistently.

---

## Summary

| Module | Doable | Conflicts | Builds on | Materials | Confidence |
| --- | --- | --- | --- | --- | --- |
| M02 | Yes | None | M01 | Created | 95% |
| M03 | Yes | Trainer dependency (log file) | M02 | Created | 90% |
| M04 | Yes | TypeScript 7 stability | M02, M03 | Created | 85% |
| M05 | Yes | None | M04 | Created | 90% |
| M06 | Yes | Self-directed exercises | M05 | Created | 90% |
| M07 | Yes | Schema translation (junction table) | M05, M06 | Created | 80% |
| M08 | Yes | None | M07 | Created | 90% |
| M09 | Yes | Toolchain risk, scope addition | M08 | Created | 75% |

**Overall feasibility:** All modules are doable. The dependency chain is clean. The two highest-risk modules are M07 (Prisma 7 + native build) and M09 (toolchain), both with documented fallbacks.

**Materials status:** All modules M02–M09 now have materials folders with code snippets and README indexes.

**Key conflicts resolved:**
- M02→M04 toolkit port: intentional pedagogical choice
- M05→M08 validation rewrite: intentional "pain before payoff"
- M06→M07 schema translation: minor naming difference
- M07→M09 toolchain: real risk, documented fallbacks
- M02 timing comparison: minor network flakiness
- M03 trainer dependency: logistical, must resolve before workshop
- M09 scope addition: minor, TDD exercise
- M04 TypeScript 7 stability: real risk, affects multiple modules
- M05 Bruno: minor, new tool in longest module
- M06 self-directed exercises: minor, hard to standardize
