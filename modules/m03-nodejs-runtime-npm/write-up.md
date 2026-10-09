# M03 Write-Up — Node.js Runtime & npm

## What I built

Two programs, both merged to main by PR:

1. **`log-report` CLI** — streams a 100MB log file into a JSON report. Uses `node:stream` to
   process the file in chunks, aggregates counts by status code, and writes a JSON report.
   Accepts options via `node:util`'s `parseArgs`.

2. **Bare `node:http` server** — three JSON endpoints:
   - `GET /health` — returns `{ status: "ok" }`
   - `GET /tasks` — returns a list of tasks
   - `GET /tasks/:id` — returns a single task

## Why it's built this way (key decisions)

- **Streams for the CLI:** Loading 100MB into memory is wasteful. Using `fs.createReadStream`
  with a `readline` interface processes one line at a time — constant memory usage.
- **Bare `node:http`:** The brief says "meant to hurt a little." Hand-rolling routing, body
  parsing, and error handling makes you appreciate what Express does for you.
- **`parseArgs`:** Used `node:util`'s `parseArgs` for CLI options instead of a library like
  `commander` — no external deps needed.

## How to build it (teach it to the next trainee)

1. CLI: create a read stream, pipe through `readline`, parse each line, aggregate counts
2. HTTP server: `createServer`, switch on `req.url` and `req.method`, parse body manually
3. Test both with `node --watch` and curl
4. For the CLI: `node log-report.mjs --input large.log --output report.json`
5. For the server: `node server.mjs` then `curl http://localhost:3000/health`

## Concepts worth explaining

- **Streams:** Process data in chunks instead of loading it all into memory. `pipe()` connects
  streams. `readline` gives you one line at a time.
- **Event loop:** Node is single-threaded but non-blocking. `fs.readFile` blocks the event loop;
  `fs/promises.readFile` doesn't. The event loop handles I/O via libuv's thread pool.

## What tripped me up

Body parsing in the HTTP server — had to collect `data` events and parse on `end`. Also the
`node:http` routing — no built-in router, so I had to parse `req.url` manually with `URL`.

## Checkpoint evidence

- Both PRs merged
- CLI streams the file (doesn't load it all at once) — verified by watching memory usage
- Can explain what Express removes pain from: routing, body parsing, error handling, middleware

## What I'd do differently

Use `node:sqlite` for the log aggregation instead of a JSON file. Also would have written
tests for the CLI (but the brief says no test framework until M09).
