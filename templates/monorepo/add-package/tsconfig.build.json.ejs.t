---
to: ./<%= packagePath %>/tsconfig.build.json
---
{
  "extends": "./tsconfig.json",
<% if (features.testing) { -%>
  "exclude": ["tests", "vitest.config.ts"],
<% } else { -%>
  "exclude": ["tests"],
<% } -%>
}
