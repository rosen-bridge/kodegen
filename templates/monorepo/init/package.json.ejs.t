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
<% if (features.changesets) { -%>
    "version": "npx changeset version && npm i",
<% } -%>
    "release": "npm run release --workspaces",
    "type-check": "npm run type-check --workspaces"
  },
  "devDependencies": {
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^8.33.0",
    "@typescript-eslint/parser": "^8.33.0",
    "eslint": "^9.28.0",
    "eslint-config-prettier": "^10.1.5",
    "eslint-plugin-check-file": "^3.2.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.changesets) { -%>
    "@changesets/cli": "^2.27.1",
    "@rosen-bridge/changeset-formatter": "^1.0.0",
<% } -%>
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3"
  }
}
