# M02 Write-Up — Modern JavaScript & Async/Await

## What I built

Async toolkit ES module (`async-toolkit.mjs`) with four utilities:
- `sleep(ms)` — promise-based delay
- `retry(fn, { retries, delayMs })` — retry a function with backoff
- `withTimeout(promise, ms)` — reject if promise takes too long
- `mapLimit(items, limit, fn)` — map with concurrency limit

Each has `node:assert` self-checks. Also did a timing comparison: 10 sequential fetches from
JSONPlaceholder took ~3000ms, 10 parallel fetches took ~1000ms. Refactored a callback-style
`fs.readFile` to async/await.

## Why it's built this way (key decisions)

- **node:assert:** The brief said no test framework yet, so I used `node:assert` for self-checks.
  Each utility has a few asserts at the bottom that run when you execute the file.
- **mapLimit was hardest:** Had to track running promises and start new ones as old ones finish.
  Used a simple counter and a recursive approach.
- **Timing comparison:** Used JSONPlaceholder because it's free and reliable. Sequential was ~3x
  slower than parallel on 10 requests — the difference comes from network latency, not CPU.

## How to build it (teach it to the next trainee)

1. Write `sleep` first — it's just `new Promise(resolve => setTimeout(resolve, ms))`
2. Write `retry` — loop with try/catch, call `sleep` between retries, throw after max retries
3. Write `withTimeout` — use `Promise.race` between the promise and a timeout that rejects
4. Write `mapLimit` — track running count, start new promises as old ones finish, collect results
5. Add self-checks at the bottom: call each function and assert the result
6. Run with `node async-toolkit.mjs` — all asserts should pass

## Concepts worth explaining

- **Event loop:** Call stack → microtask queue (promises) → macrotask queue (setTimeout).
  `await` yields to the microtask queue. `setTimeout` callbacks go to the macrotask queue.
- **`forEach(async)` pitfall:** `forEach` doesn't wait for async callbacks — it fires them all and
  moves on. Use `for...of` or `Promise.all` with `map` instead.

## What tripped me up

`withTimeout` — the timeout promise kept the event loop alive even after the main promise
resolved. Had to clear the timeout with `clearTimeout` in a `finally` block. Also `mapLimit` —
my first version didn't preserve order, had to fix that.

## Checkpoint evidence

- All self-checks pass: `node async-toolkit.mjs`
- Timing: sequential 10 fetches ~3000ms, parallel ~1000ms
- Can predict output order of mixed setTimeout/promise/await snippet

## What I'd do differently

Write the self-checks first (TDD style) instead of after. Also would have used `Promise.allSettled`
in the timing comparison to handle errors better.
