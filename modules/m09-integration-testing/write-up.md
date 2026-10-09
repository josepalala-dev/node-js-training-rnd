# M09 Write-Up — Integration Testing with Jest + Supertest

## What I built

Task API v4: 25+ integration tests covering every endpoint and error path:
- Happy paths: create, read, update, delete tasks
- Validation failures: 400 with `details`
- 404 for missing tasks
- 409 on unique violations
- Malformed JSON
- Pagination, filter, sort
- Middleware behavior: request-ID header, 404 handler
- Error handler never leaking stack traces

Passing GitHub Actions workflow. 80%+ coverage report. Added `PATCH /tasks/:id/complete`
test-first (red → green → refactor).

## Why it's built this way (key decisions)

- **`@swc/jest`:** Fast — strips types, doesn't type-check. `tsc --noEmit` is the type gate.
  Had to fall back to `ts-jest` because `@swc/jest` didn't cooperate with the Prisma-generated
  client in ESM mode.
- **Separate `test.db`:** `globalSetup` runs `prisma migrate deploy` before the suite. Clean
  tables in `beforeEach` in foreign-key-safe order.
- **`--runInBand`:** SQLite allows a single writer, so tests run sequentially.
- **`--randomize`:** Runs tests in random order. If the suite fails, something depends on
  execution order — that's a bug to fix.

## How to build it (teach it to the next trainee)

1. Set up Jest with `@swc/jest`, ESM mode
2. `globalSetup` runs `prisma migrate deploy` against `test.db`
3. Write tests for happy paths, validation failures, 404s, 409s, malformed JSON
4. Write tests for pagination/filter/sort and middleware behavior
5. Add `PATCH /tasks/:id/complete` test-first (red → green → refactor)
6. Set up GitHub Actions: `npm ci` → `prisma generate` → `typecheck` → `test`

## Concepts worth explaining

- **Integration tests with real DB:** Tests hit the real exported app and real SQLite database.
  No mocking the database — mocks hide integration bugs.
- **`--randomize`:** Runs tests in random order. If the suite fails, something depends on
  execution order — that's a bug to fix, not a flag to avoid.

## What tripped me up

`@swc/jest` + Prisma ESM — had to fall back to `ts-jest` because `@swc/jest` didn't cooperate
with the Prisma-generated client. Also test isolation — forgot to clean tables in `beforeEach`
and tests started interfering with each other.

## Checkpoint evidence

- Green CI on PR
- 80%+ coverage on routes and services
- Suite passes with `--randomize`
- `PATCH /tasks/:id/complete` added test-first

## What I'd do differently

Set up the test database strategy before writing any tests. Also would have written fewer
tests initially and added more incrementally — writing 25+ tests at once was overwhelming.
