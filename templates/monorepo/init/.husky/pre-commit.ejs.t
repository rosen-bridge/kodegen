---
to: ./<%= monorepoName %>/.husky/pre-commit
sh: cd <%= monorepoName %> && git init --initial-branch=feat/initialize-monorepo
---
npx lint-staged
