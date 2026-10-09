# M06 Write-Up — SQL Fundamentals with SQLite

## What I built

`users`/`tasks`/`tags`/`task_tags` schema with DDL and seed SQL. 20+ query exercises covering:
- Filtering, sorting, pagination (`LIMIT`/`OFFSET`)
- `INNER` and `LEFT` joins
- Aggregates with `GROUP BY`/`HAVING`
- At least one subquery
- One explicit transaction (`BEGIN`/`COMMIT`/`ROLLBACK`)

Mermaid ERD in the README. SQL-injection demo: wrote a vulnerable query with string concatenation,
then fixed it with parameters.

## Why it's built this way (key decisions)

- **`task_tags` junction table:** M:N relationship between tasks and tags. Each row links one
  task to one tag. Composite primary key `(taskId, tagId)`.
- **Self-directed exercises:** The brief says there's no shared exercise bank, so I wrote my own
  against my own schema. The trainer verifies by picking a few at random.
- **SQL-injection demo:** Wrote a vulnerable query with string concatenation, then fixed it with
  parameters. The vulnerable version actually succeeds (returns all rows), the fixed version
  blocks it.

## How to build it (teach it to the next trainee)

1. Design the schema on paper first — entities, relationships, keys
2. Write DDL: `CREATE TABLE` with primary keys, foreign keys, indexes
3. Write seed `INSERT` statements
4. Write 20+ queries: filtering, sorting, pagination, joins, aggregates, subqueries
5. Draw the ERD in Mermaid
6. SQL-injection demo: vulnerable query vs parameterised fix

## Concepts worth explaining

- **Primary vs foreign keys:** Primary key uniquely identifies a row. Foreign key references a
  primary key in another table. `ON DELETE CASCADE` deletes child rows when the parent is deleted.
- **Indexes:** Speed up queries on filtered columns. `EXPLAIN QUERY PLAN` shows if an index is
  used. Without an index, SQLite does a full table scan.
- **SQL injection:** Never concatenate user input into SQL. Use parameterized queries — the
  database treats parameters as data, not code.

## What tripped me up

The junction table naming — Prisma uses `_TaskToTag` but I wanted `task_tags`. Had to understand
the mapping for M07. Also forgot `PRAGMA foreign_keys = ON` initially — foreign key constraints
weren't enforced until I added it.

## Checkpoint evidence

- 20+ exercises written and run
- Mermaid ERD in README
- SQL-injection demo succeeds against vulnerable query, parameterised fix blocks it

## What I'd do differently

Use `PRAGMA foreign_keys = ON` from the start. Also would have written a few more subquery
examples — the brief says "at least one" but more practice would have helped.
