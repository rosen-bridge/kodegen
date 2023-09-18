---
to: ./<%= packagePath %>/tsconfig.build.json
---
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "rootDir": "./lib"
  },
<% if (features.testing) { -%>
  "exclude": ["tests", "vitest.config.ts"],
<% } else { -%>
  "exclude": ["tests"],
<% } -%>
}
