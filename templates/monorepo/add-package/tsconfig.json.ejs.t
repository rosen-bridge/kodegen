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
    "outDir": "./dist",
<% if (testing) { -%>
    "types": ["node", "vitest/globals"],
<% } else { -%>
    "types": ["node"],
<% } -%>
  },
<% if (testing) { -%>
  "include": ["tests", "lib"]
<% } else { -%>
  "include": ["lib"]
<% } -%>
}
