---
to: ./<%= monorepoName %>/.husky/pre-commit
sh: cd <%= monorepoName %> && git init --initial-branch=feat/initialize-monorepo && chmod +x .husky/pre-commit
---
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx lint-staged
