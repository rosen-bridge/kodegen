---
to: ./<%= packagePath %>/package.json
sh: cd <%= packagePath %> && npx --yes sort-package-json && npm i
---
<%
    const normalizedPackagePath = packagePath.replace('./', '');
    const depth = normalizedPackagePath.split('/').length;
    relativeIgnorePath = '../'.repeat(depth) + '.gitignore';
%>
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
<% if (h.rootHasEslint) { -%>
    "prettify": "prettier --write .<% if (relativeIgnorePath) { %> --ignore-path <%= relativeIgnorePath %><% } %>",
    "prettify:check": "prettier --check .<% if (relativeIgnorePath) { %> --ignore-path <%= relativeIgnorePath %><% } %>",
    "lint": "eslint --fix . && npm run prettify",
    "lint:check": "eslint . && npm run prettify:check",
<% } -%>
<% if (testing) { -%>
    "test": "NODE_OPTIONS='--import tsx' vitest",
    "coverage": "npm run test -- --coverage",
<% } -%>
    "build": "tsc --build tsconfig.build.json",
    "type-check": "tsc --noEmit",
<% if (testing) { -%>
    "release": "npm run test -- --run && npm run build && npm publish --access public"
<% } else { -%>
    "release": "npm run build && npm publish --access public"
<% } -%>
  },
  "author": "<%= author %>",
  "license": "MIT",
  "devDependencies": {
<% if (testing) { -%>
    "@vitest/coverage-istanbul": "^3.1.4",
    "vitest": "^3.1.4",
    "tsx": "^4.19.4",
<% } -%>
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=22.18.0"
  }
}

