# M01 Materials — Environment Setup

Trainer-facing reference snippets for the M01 workshop: Dev Environment, Git & GitHub.

## What a NodeJS developer produces in M01

Three artifacts, delivered through a merged PR with 3+ Conventional Commits
and a resolved merge conflict:

| Artifact | File | Purpose |
| --- | --- | --- |
| hello-node script | `hello-node.mjs` | Minimal Node.js script — proves the toolchain works |
| .gitignore | `.gitignore` | Keeps secrets and generated files out of Git |
| .env.example | `.env.example` | Documents required env vars without committing real values |

## Snippet index

| File | What it covers |
| --- | --- |
| `01-verify-toolchain.sh` | Confirm Node, npm, and Git are installed |
| `02-configure-git.sh` | Set Git identity for commits |
| `03-init-repo.sh` | Initialize repo and connect remote |
| `04-everyday-git.sh` | Core Git workflow: status, add, commit, log, diff |
| `05-branching.sh` | Create branches, merge, resolve conflicts |
| `06-hello-node.mjs` | The hello-node script |
| `07-gitignore` | .gitignore for a Node project |
| `08-env-example` | .env.example with documented variables |
| `09-conventional-commits.sh` | Conventional Commit message examples |

## How to use these in the workshop

1. **Before the workshop:** Participants run `01-verify-toolchain.sh` to confirm
   their environment is ready.
2. **During the workshop:** The trainer demos each snippet, then participants
   follow along on their own machines.
3. **After the workshop:** Participants use the snippets as reference while
   completing the M01 lab (branch → PR → review → merge).

These snippets are reference material — they show the commands and file
contents, but the participant still has to execute them and understand what
each one does.
