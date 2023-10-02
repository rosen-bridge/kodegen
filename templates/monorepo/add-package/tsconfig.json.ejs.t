---
to: ./<%= packagePath %>/tsconfig.json
---
<%
    normalizedPackagePath = packagePath.replace('./', '')
    depth = normalizedPackagePath.split('/').length
    extendsPath = '../'.repeat(depth) + 'tsconfig.base.json'
%>
{
  "extends": "<%= extendsPath %>",
  "compilerOptions": {
    "outDir": "./dist"
  },
<% if (features.testing) { -%>
  "include": ["tests", "lib", "vitest.config.ts"]
<% } else { -%>
  "include": ["tests", "lib"]
<% } -%>
}
