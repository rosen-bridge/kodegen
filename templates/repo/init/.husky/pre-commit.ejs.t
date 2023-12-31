---
to: ./<%= projectName %>/.husky/pre-commit
sh: cd <%= projectName %> && git init && npx --yes husky install && chmod +x .husky/pre-commit
---
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx lint-staged
