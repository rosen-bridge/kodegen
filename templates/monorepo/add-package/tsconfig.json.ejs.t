---
to: ./<%= packagePath %>/tsconfig.json
---
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist"
  },
<% if (features.testing) { -%>
  "include": ["tests", "lib", "vitest.config.ts"]
<% } else { -%>
  "include": ["tests", "lib"]
<% } -%>
}
