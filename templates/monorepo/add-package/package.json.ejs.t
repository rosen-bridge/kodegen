---
to: ./<%= packagePath %>/package.json
sh: cd <%= packagePath %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(packageName) %>",
  "version": "0.0.1",
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
    "build": "tsc --build",
    "type-check": "tsc --noEmit",
    "release": "npm run build && npm publish --access public"
  },
  "author": "<%= author %>",
  "license": "ISC",
  "devDependencies": {
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^5.26.0",
    "@typescript-eslint/parser": "^5.26.0",
    "eslint": "^8.16.0",
    "eslint-config-prettier": "^8.5.0",
    "prettier": "2.7.1",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-c8": "^0.26.3",
    "vitest": "^0.26.2",
<% } -%>
    "@types/node": "^18.11.18",
    "typescript": "^5.0.0"
  },
  "engines": {
    "node": ">=18.12.0"
  }
}

