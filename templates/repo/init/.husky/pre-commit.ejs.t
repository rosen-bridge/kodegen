---
to: ./<%= projectName %>/.husky/pre-commit
sh: cd <%= projectName %> && git init --initial-branch=feat/initialize-project
---
npx lint-staged
