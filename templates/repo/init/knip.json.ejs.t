---
to: "<%= features.knip ? `./${projectName}/knip.json` : null %>"
---
{
  "$schema": "https://unpkg.com/knip/schema.json",
  "ignore": [
    "tsx",
    "lint-staged",
    "@vitest/coverage-istanbul", 
    "extensionless",
    "reflect-metadata",
    "@types/json-bigint",
    "@babel/preset-env",
    "@types/jest",
    "@typescript-eslint/eslint-plugin",
    "@typescript-eslint/parser", 
    "@types/node",
    "eslint-config-prettier",
    "@rosen-bridge/changeset-formatter"
  ],
  "ignoreDependencies": [
    "tsx",
    "lint-staged", 
    "@vitest/coverage-istanbul",
    "extensionless",
    "reflect-metadata",
    "@types/json-bigint",
    "@babel/preset-env",
    "@types/jest",
    "@typescript-eslint/eslint-plugin",
    "@typescript-eslint/parser",
    "@types/node",
    "eslint-config-prettier",
    "@rosen-bridge/changeset-formatter"
  ],
  "ignoreBinaries": ["tsx"],
  "ignoreWorkspaces": ["**/dist/**", "**/node_modules/**"]
}