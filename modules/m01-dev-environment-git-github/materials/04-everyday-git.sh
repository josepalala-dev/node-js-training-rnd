# Everyday Git workflow: status, add, commit, log, diff.

# Check the status of your working tree
git status

# Stage changes for commit
git add .                    # Stage all changes
git add hello-node.mjs       # Stage a specific file

# Commit staged changes with a Conventional Commit message
git commit -m "feat: add hello-node script"

# View commit history
git log --oneline

# See what changed in the working tree
git diff

# See what changed between commits
git diff HEAD~1
