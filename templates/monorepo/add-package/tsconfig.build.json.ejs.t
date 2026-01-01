---
to: ./<%= packagePath %>/tsconfig.build.json
---
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "rootDir": "./lib"
  },
<% if (testing) { -%>
  "exclude": ["tests", "vitest.config.ts"],
<% } -%>
}
