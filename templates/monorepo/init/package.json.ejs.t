---
to: ./<%= monorepoName %>/package.json
sh: cd <%= monorepoName %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(monorepoName) %>",
  "private": true,
  "type": "module",
  "workspaces": {
    "packages": [
      "packages/*"
    ]
  },
  "scripts": {
    "build": "npm run build --workspaces",
<% if (features.testing) { -%>
    "test": "npm run test --workspaces",
    "coverage": "npm run coverage --workspaces",
<% } -%>
<% if (features.prettierEslint) { -%>
    "lint": "npm run lint --workspaces",
<% } -%>
    "prepare": "husky install",
    "release": "npm run release --workspaces",
    "type-check": "npm run type-check --workspaces"
  },
  "devDependencies": {
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3",
<% if (features.testing) { -%>
    "vitest": "^0.26.2",
<% } -%>
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^5.26.0",
    "@typescript-eslint/parser": "^5.26.0",
    "eslint": "^8.16.0",
    "eslint-config-prettier": "^8.5.0",
    "prettier": "2.7.1",
    "typescript": "^5.0.0"
<% } -%>
  }
}
