---
to: ./<%= packagePath %>/package.json
sh: cd <%= packagePath %> && npx --yes sort-package-json && npm i
---
{
  "name": "<%= h.inflection.dasherize(packageName) %>",
  "version": "0.0.0",
  "description": "<%= description %>",
  "repository": "<%= repo %>",
  "main": "dist/index.js",
  "types": "dist/index.d.ts",
  "type": "module",
  "files": [
    "dist",
    "CHANGELOG.md"
  ],
  "scripts": {
<% if (features.prettierEslint) { -%>
    "prettify": "prettier --write . --ignore-path ./.gitignore",
    "lint": "eslint --fix . && npm run prettify",
<% } -%>
<% if (features.testing) { -%>
    "test": "NODE_OPTIONS='--import tsx' vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
    "build": "tsc --build tsconfig.build.json",
    "type-check": "tsc --noEmit",
<% if (features.testing) { -%>
    "release": "npm run test -- --run && npm run build && npm publish --access public"
<% } else { -%>
    "release": "npm run build && npm publish --access public"
<% } -%>
  },
  "author": "<%= author %>",
  "license": "GPL-3.0",
  "devDependencies": {
<% if (features.prettierEslint) { -%>
    "@typescript-eslint/eslint-plugin": "^8.33.0",
    "@typescript-eslint/parser": "^8.33.0",
    "eslint": "^9.28.0",
    "eslint-config-prettier": "^10.1.5",
    "eslint-plugin-check-file": "^3.2.0",
    "prettier": "^3.2.4",
<% } -%>
<% if (features.testing) { -%>
    "@vitest/coverage-istanbul": "^3.1.4",
    "vitest": "^3.1.4",
    "tsx": "^4.19.4",
<% } -%>
    "@types/node": "^20.11.9",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.11.0"
  }
}

