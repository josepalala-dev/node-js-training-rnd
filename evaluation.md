# Feasibility Evaluation — M02 through M09

**Date:** 2026-10-08
**Purpose:** Assess whether each module is doable, creates conflicts, builds on prior modules, and has materials created. Confidence intervals reflect toolchain risk, scope clarity, and dependency complexity.

---

## M02 — Modern JavaScript & Async/Await

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — pure JavaScript, no external dependencies except JSONPlaceholder (free, no auth) |
| **Conflicts** | None — standalone module, no shared code |
| **Builds on** | M01 (Git workflow, branch → PR → merge habit) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **95%** — well-scoped, clear deliverable, uses free API |

**Notes:** The async toolkit (`sleep`, `retry`, `withTimeout`, `mapLimit`) is self-contained. The timing comparison and callback-to-async refactor are straightforward. The only external dependency is JSONPlaceholder, which is reliable and free.

---

## M03 — Node.js Runtime & npm

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — uses Node core modules only, no external deps |
| **Conflicts** | None — standalone module |
| **Builds on** | M02 (async patterns reused in CLI lab) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **90%** — clear deliverable, trainer provides log file |

**Notes:** The `log-report` CLI and bare `node:http` server are self-contained. The trainer provides a synthetic log file (~100 MB). The "pain" of hand-rolling HTTP is intentional — it motivates Express in M05.

---

## M04 — TypeScript Basics & TypeScript on Node.js

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — ports M02 toolkit to TypeScript |
| **Conflicts** | None — builds on M02 code |
| **Builds on** | M02 (toolkit), M03 (async patterns) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **85%** — TypeScript 7 is new but well-documented |

**Notes:** The M02 toolkit port is mechanical. The Task domain types (`Task`, `CreateTaskInput`, `UpdateTaskInput`, `Result<T, E>`) are new but straightforward. The `erasableSyntaxOnly` constraint is the main learning curve. Native type stripping on Node 24 is awareness-level, not a hard requirement.

---

## M05 — Express: Routing, Middleware & Error Handling

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — in-memory store, Express 5, no database yet |
| **Conflicts** | None — starts the Task API |
| **Builds on** | M04 (TypeScript, Task domain types) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **90%** — clear contract, well-defined deliverable |

**Notes:** The error envelope is fixed. The `app.ts`/`server.ts` split is clear. The Bruno collection is new but well-documented. The hand-written validation is deliberate — it motivates Zod in M08. This is the Week 2 Friday gate.

---

## M06 — SQL Fundamentals with SQLite

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — SQLite only, no external deps |
| **Conflicts** | None — schema design, no code yet |
| **Builds on** | M05 (in-memory store gets replaced by real schema) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **90%** — self-contained, clear deliverable |

**Notes:** The `users`/`tasks`/`tags`/`task_tags` schema is well-defined. The 20+ query exercises are self-directed. The SQL-injection demo is straightforward. The Mermaid ERD is documentation-only. No code conflicts — this is schema design before Prisma lands in M07.

---

## M07 — Prisma ORM & Migrations

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — translates M06 schema to Prisma |
| **Conflicts** | **Possible** — `better-sqlite3` native build on Windows |
| **Builds on** | M05 (API), M06 (schema) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **80%** — Prisma 7 is new, native module risk |

**Notes:** The main risk is `better-sqlite3` native compilation on Windows. The fallback is `@prisma/adapter-libsql`. The Prisma 7 config file (`prisma7.config.ts`) and driver adapter setup are new patterns. The migration workflow (`migrate dev`, `--create-only`, `migrate deploy`) is well-documented. The service layer replaces the in-memory store from M05.

---

## M08 — Zod Validation & Type Inference

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — replaces hand-written validation with Zod |
| **Conflicts** | None — builds on M07 |
| **Builds on** | M07 (Prisma, service layer) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **90%** — clear scope, well-defined deliverable |

**Notes:** The Zod schemas for create/update/list-query/params are straightforward. The `validate` middleware pattern is clear. The `req.query` read-only workaround in Express 5 is documented. The env validation in `config.ts` is simple. The "no manual `if (!body.title)` checks" requirement is verifiable.

---

## M09 — Integration Testing with Jest + Supertest

| Criterion | Assessment |
| --- | --- |
| **Doable** | Yes — Jest + Supertest against exported app |
| **Conflicts** | **Possible** — `@swc/jest` + Prisma ESM issues |
| **Builds on** | M08 (Zod validation, Task API v3) |
| **Materials created** | Yes — materials folder with code snippets |
| **Confidence** | **75%** — toolchain risk, but fallbacks documented |

**Notes:** The main risk is `@swc/jest` cooperating with the Prisma-generated client in ESM mode. The fallback order is documented: `ts-jest` → TypeScript 6 for tests → CommonJS. The test database strategy (separate `test.db`, `globalSetup`, `beforeEach` cleanup) is well-defined. The 25+ tests and 80% coverage target are achievable. The `--randomize` requirement is a good correctness check.

---

## Summary

| Module | Doable | Conflicts | Builds on | Materials | Confidence |
| --- | --- | --- | --- | --- | --- |
| M02 | Yes | None | M01 | Yes | 95% |
| M03 | Yes | Trainer dependency (log file) | M02 | Yes | 90% |
| M04 | Yes | TypeScript 7 stability | M02, M03 | Yes | 85% |
| M05 | Yes | None | M04 | Yes | 90% |
| M06 | Yes | Self-directed exercises | M05 | Yes | 90% |
| M07 | Yes | Schema translation (junction table) | M05, M06 | Yes | 80% |
| M08 | Yes | None | M07 | Yes | 90% |
| M09 | Yes | Toolchain risk, scope addition | M08 | Yes | 75% |

**Overall feasibility:** All modules are doable. The dependency chain is clean. The two highest-risk modules are M07 (Prisma 7 + native build) and M09 (toolchain), both with documented fallbacks.

**Materials status:** All modules M02–M09 have materials folders with code snippets and README indexes.

**Key conflicts identified:**
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
