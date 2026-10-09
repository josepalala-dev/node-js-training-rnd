# M05 Write-Up — Express: Routing, Middleware & Error Handling

## What I built

Task API v1: in-memory Express REST API at `/api/v1/tasks` with:
- `app.ts` — builds and exports the Express app (no `listen`)
- `server.ts` — listens and shuts down gracefully on `SIGTERM`
- `AppError` hierarchy — `BadRequestError`, `NotFoundError`, `ConflictError`
- Central error handler producing the fixed envelope
- Request-ID and logging middleware
- Five `/api/v1/tasks` endpoints with hand-written validation
- Bruno collection with assertions for every endpoint and error path

## Why it's built this way (key decisions)

- **`app.ts` / `server.ts` split:** The brief says this separation makes M09's testing trivial.
  `app.ts` exports the app, `server.ts` is the only file that calls `listen`.
- **Hand-written validation:** Deliberate — the brief says M08 replaces it with Zod. The "pain"
  of writing `if (!body.title)` checks makes you appreciate Zod.
- **Error envelope:** `{ error: { code, message, details?, requestId } }` — fixed shape for all
  errors. `details` only on validation errors.
- **pino-http:** Used for logging because the brief says "no console.log." Redacts `authorization`
  and `x-api-key` headers.

## How to build it (teach it to the next trainee)

1. Write `app.ts` with `express()`, middleware, routes, error handler
2. Write `server.ts` with `app.listen()` and graceful shutdown
3. Build `AppError` hierarchy: `BadRequestError` (400), `NotFoundError` (404), `ConflictError` (409)
4. Five endpoints: GET/POST `/tasks`, GET/PATCH/DELETE `/tasks/:id`
5. Hand-written validation: check `body.title` exists, `body.status` is valid, etc.
6. Bruno collection with assertions for each endpoint and error path

## Concepts worth explaining

- **Express 5 async error handling:** Rejected promises in async handlers are forwarded to the
  error handler automatically. No try/catch wrapper needed — just `next(err)` or throw.
- **Middleware order:** Request-ID → logging → routes → 404 → error handler. Order matters —
  if logging is after routes, you won't log 404s.

## What tripped me up

`req.query` is a read-only getter in Express 5 — can't assign to it directly. Also the error
handler signature — it must have 4 arguments `(err, req, res, next)` for Express to recognize
it as an error handler.

## Checkpoint evidence

- v1 merged by PR
- Every error path returns the exact envelope shape
- Bruno collection passes

## What I'd do differently

Use Zod from the start instead of hand-written validation (but that's M08's job). Also would
have added `helmet` and `cors` earlier — forgot them until the end.
