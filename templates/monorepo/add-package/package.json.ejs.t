---
to: ./<%= packagePath %>/package.json
sh: cd <%= packagePath %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(packageName) %>",
  "version": "0.1.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "dist/index.js",
  "types": "dist/index.d.ts",
  "type": "module",
  "scripts": {
<% if (features.prettierEslint) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
<% } -%>
<% if (features.testing) { -%>
    "test": "vitest",
    "coverage": "vitest run --coverage",
<% } -%>
    "build": "tsc --build tsconfig.build.json",
    "type-check": "tsc --noEmit",
    "release": "npm run build && npm publish --access public"
  },
  "author": "<%= author %>",
  "license": "GPL-3.0",
  "devDependencies": {
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^6.19.1",
    "@typescript-eslint/parser": "^6.19.1",
    "eslint": "^8.56.0",
    "eslint-config-prettier": "^9.1.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-istanbul": "^1.2.2",
    "vitest": "^1.2.2",
<% } -%>
    "@types/node": "^20.11.9",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.11.0"
  }
}

