# Checkpoint Review Prompt

Use this prompt (as-is, or via `/checkpoint <module>`) to verify a training module's
deliverables actually meet its stated requirements before marking it done.

---

## Prompt

You are reviewing module **{MODULE_NAME}** of this Node.js training repo against its
stated learning objectives. Do not trust README claims, commit messages, or prior
"done" markers — verify against the actual code and a real run.

**Scope for this training track** (only check items relevant to the module under review):

1. Modern JavaScript, async/await, the Node.js runtime and npm
2. TypeScript 7 on Node.js
3. A REST API in Express 5 with middleware and a central error handler
4. SQL on SQLite, and Prisma 7 with migrations
5. Zod 4 validation with type inference
6. Integration tests with Jest 30 and Supertest, run in GitHub Actions
7. Git and a GitHub pull-request workflow, with Bruno for manual API testing

**Steps:**

1. Identify which of the 7 areas above this module claims to cover. State them explicitly.
2. For each claimed area, find concrete evidence in the repo (file paths, line numbers,
   package.json entries, config files). "Mentioned in a comment" is not evidence —
   working code is.
3. Run the real checks, don't just read code:
   - `npm ls` / `package.json` — correct packages and major versions pinned
     (TypeScript 7, Express 5, Prisma 7, Zod 4, Jest 30) — no silent downgrade.
   - `npx tsc --noEmit` (or project's typecheck script) — passes with strict mode.
   - Start the server, hit at least one real endpoint, confirm middleware and the
     central error handler actually fire (e.g. trigger a validation error and check
     the response shape, not just a 200 on the happy path).
   - Confirm a Prisma migration exists and `prisma migrate` applies cleanly against a
     throwaway SQLite file.
   - Confirm Zod schemas drive both runtime validation and inferred TypeScript types
     (not a duplicated hand-written interface sitting next to the schema).
   - Run the test suite (`npm test` or equivalent) and confirm it uses Jest 30 +
     Supertest against a real (not fully mocked) route, and that a corresponding
     GitHub Actions workflow runs it on push/PR.
   - Confirm there's a `.bru` collection (Bruno) covering the module's endpoints, and
     that the module's work landed via a PR (not a direct push to main), per repo
     conventions.
4. For each of the 7 areas: mark **MET**, **PARTIAL** (say exactly what's missing), or
   **NOT MET**. Do not mark MET on the strength of intent, scaffolding, or TODOs.
5. List concrete gaps as action items, each with the file/command that would close it.
6. Keep the final report short: one line per area plus a gaps list. No preamble, no
   restating this prompt back.

**Explicitly do not:**
- Accept a passing build alone as proof of a working feature.
- Accept mocked-everything tests as integration test coverage.
- Give partial credit for a dependency merely being installed with no code using it.
