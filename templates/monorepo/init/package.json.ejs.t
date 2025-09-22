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
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    "lint": "npm run lint --workspaces",
    "lint:check": "npm run lint:check --workspaces",
<% } -%>
    "prepare": "husky install",
<% if (features.changesets) { -%>
    "version": "npx changeset version && npm i",
<% } -%>
    "release": "npm run release --workspaces",
    "type-check": "npm run type-check --workspaces"
  },
  "devDependencies": {
    "@types/node": "^22.18.0",
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    "@typescript-eslint/eslint-plugin": "^8.43.0",
    "@typescript-eslint/parser": "^8.43.0",
    "eslint": "^9.35.0",
    <% if (features.testing) { -%>
    "@vitest/eslint-plugin": "^1.3.9",
    <% } -%>
    "globals": "16.3.0",
    <% if (features.eslintFeaturesReact) { -%>
    "eslint-plugin-react-hooks": "^5.2.0",
    "eslint-plugin-react-refresh": "^0.4.20",
    <% } -%>
    "eslint-config-prettier": "^10.1.5",
    "eslint-plugin-check-file": "^3.2.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.changesets) { -%>
    "@changesets/cli": "^2.27.1",
    "@rosen-bridge/changeset-formatter": "^1.1.0",
<% } -%>
<% if (features.depcheck) { -%>
    "depcheck": "^1.4.7",
<% } -%>
    "husky": "^8.0.0",
    "lint-staged": "^13.0.3"
  }
}
