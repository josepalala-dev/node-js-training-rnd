# M04 Write-Up — TypeScript Basics & TypeScript on Node.js

## What I built

M02 toolkit ported to TypeScript with generics:
- `sleep(ms: number): Promise<void>`
- `retry<T>(fn: () => Promise<T>, options: { retries: number; delayMs: number }): Promise<T>`
- `withTimeout<T>(promise: Promise<T>, ms: number): Promise<T>`
- `mapLimit<T, R>(items: T[], limit: number, fn: (item: T) => Promise<R>): Promise<R[]>`

Task domain types:
- `Task`, `CreateTaskInput`, `UpdateTaskInput`, `Result<T, E>`

Zero `tsc --noEmit` errors under a strict config.

## Why it's built this way (key decisions)

- **`type` vs `interface`:** Used `type` for the domain types because the brief says "union types
  instead of enum" and `type` is more flexible for unions. `interface` would work too but `type`
  is more idiomatic for unions.
- **`Result<T, E>`:** Discriminated union — `{ ok: true; value: T } | { ok: false; error: E }`.
  This forces the caller to check `ok` before accessing `value` or `error`.
- **`erasableSyntaxOnly`:** No enums, no parameter properties. Used `as const` arrays instead of
  enums for `TaskStatus`.

## How to build it (teach it to the next trainee)

1. Set up `tsconfig.json` with strict settings: `strict`, `module: nodenext`, `verbatimModuleSyntax`,
   `erasableSyntaxOnly`, `noUncheckedIndexedAccess`, `noEmit`, `skipLibCheck`
2. Port each utility one at a time, adding types
3. Use generics for `retry<T>` and `mapLimit<T, R>`
4. Run `tsc --noEmit` after each file — fix errors before moving on
5. Run the toolkit via `tsx async-toolkit.ts`

## Concepts worth explaining

- **`unknown` vs `any`:** `unknown` is type-safe — you must narrow it before using it. `any`
  disables type checking entirely. Use `unknown` for untrusted data, `any` as a last resort.
- **`type` vs `interface`:** `type` can represent unions, primitives, and computed types.
  `interface` is better for object shapes that might be extended. For unions, use `type`.

## What tripped me up

`erasableSyntaxOnly` — couldn't use enums or parameter properties. Had to use `as const` and
explicit field declarations. Also `noUncheckedIndexedAccess` — accessing an array by index
returns `T | undefined`, so I had to add null checks everywhere.

## Checkpoint evidence

- Zero `tsc --noEmit` errors
- Toolkit runs via `tsx async-toolkit.ts`
- Can explain `unknown` vs `any` and `type` vs `interface`

## What I'd do differently

Set up the TypeScript project before porting any code (the brief says to do this). Also would
have used `satisfies` more to validate object shapes without widening types.
