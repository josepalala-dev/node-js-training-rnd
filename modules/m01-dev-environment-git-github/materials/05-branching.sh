# Branching and merging.

# Create and switch to a new branch
git checkout -b feat/hello-node

# List all branches
git branch

# Switch back to main
git checkout main

# Merge a branch into the current branch
git merge feat/hello-node

# If there is a conflict, resolve it in the editor, then:
git add .
git commit -m "merge: resolve conflict in hello-node script"

# Delete a branch after merging
git branch -d feat/hello-node
