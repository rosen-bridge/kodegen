---
to: ./package.json
inject: true
after: packages
skip_if: <%= packagePath.replace(/\.\/(.+)\/.+/, '$1') %>
sh: npx --yes sort-package-json
---
      "<%= packagePath.replace(/\.\/(.+)\/.+/, '$1') %>/*",
