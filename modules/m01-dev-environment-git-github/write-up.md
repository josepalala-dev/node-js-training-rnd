# M01 Write-Up — Dev Environment, Git & GitHub

## What I built

Public repo: https://github.com/example/trainee-m01
Script: `hello-node.mjs` — just `console.log('Hello, Node!')`
PR: https://github.com/example/trainee-m01/pull/1 (merged)

The repo has `.gitignore` covering `node_modules/`, `.env`, `*.db`, `src/generated/`, `dist/`,
`coverage/`. Also has `.env.example` with placeholder comments even though there's nothing to
configure yet — the brief said it's about the habit.

## Why it's built this way (key decisions)

- **Branch structure:** Used `feat/hello-node` branch because the brief said not to push to main
  directly. Made 3 commits: one for the script, one for `.gitignore`, one for `.env.example`.
  Then merged via PR.
- **Public vs private:** The repo is public because the brief said so — it's the program convention.
  If it were private with a no-direct-push rule, the PR workflow would be the same but I'd need
  branch protection rules set up by an admin first. The merge conflict exercise would be harder
  because we couldn't just push to any branch.
- **Merge conflict resolution:** My partner and I both edited the same line in the README. We
  resolved it by keeping both changes and committing the merge. Rebase would have been cleaner
  (linear history) but we didn't know how to do it yet — the brief says merge vs rebase is
  conceptual only at this stage.

## How to build it (teach it to the next trainee)

1. `git init` in your project folder
2. `git checkout -b feat/hello-node` — create a feature branch
3. Write `hello-node.mjs` with `console.log('Hello, Node!')`
4. `git add .` then `git commit -m "feat: add hello-node script"`
5. Add `.gitignore` and `.env.example`
6. `git add .` then `git commit -m "chore: add .gitignore and .env.example"`
7. Push branch: `git push -u origin feat/hello-node`
8. Open PR on GitHub, request review from your partner
9. Partner reviews, you address feedback
10. Create a merge conflict deliberately (both edit same line), resolve it together
11. Merge the PR once it has 3+ Conventional Commits

## Concepts worth explaining

- **Working tree → staging → commit:** Files start in the working tree (unstaged). `git add`
  moves them to staging. `git commit` saves them to history. `git status` shows where files are.
- **`git revert` vs `git reset`:** Revert creates a new commit that undoes a previous commit —
  safe for shared branches because it doesn't rewrite history. Reset moves the branch pointer
  backward, erasing commits — dangerous for shared branches because it rewrites history.

## What tripped me up

GitHub auth on Windows — I tried SSH keys first but couldn't get them working. Ended up using
the GitHub CLI (`gh auth login`) which was easier. Also forgot to create `.env.example` until
the trainer reminded me — the brief says it's about the habit, not the content.

## Checkpoint evidence

- Merged PR: https://github.com/example/trainee-m01/pull/1
- `.gitignore` present and covers the full Node-project list
- `.env.example` present
- `git revert` vs `git reset` explanation above

## What I'd do differently

Set up SSH keys on Day 1 instead of using HTTPS with a credential manager. Also would have
read the brief fully before starting — I missed the `.env.example` requirement at first.
