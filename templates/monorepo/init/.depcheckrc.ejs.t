---
to: "<%= features.depcheck ? `./${monorepoName}/.depcheckrc` : null %>"
---
ignores: ["tsx", "lint-staged", "depcheck", "@vitest/coverage-istanbul", "extensionless", "reflect-metadata", "@types/json-bigint", "@babel/preset-env", "@types/jest", "@typescript-eslint/eslint-plugin", "@typescript-eslint/parser", "@types/node", "eslint-config-prettier", "@rosen-bridge/changeset-formatter"]
ignore-patterns: ['vitest.config.ts.timestamp-*', '**/vitest.config.ts.timestamp-*', '**/dist/*', 'node_modules', '**/node_modules']
