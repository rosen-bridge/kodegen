---
to: ./<%= monorepoName %>/.lintstagedrc.js
---
export default {
  '*.ts': () => 'tsc --noEmit',
<% if (features.prettierEslint) { -%>
  '*.{js,ts}': 'eslint --fix',
  '*': 'prettier --ignore-unknown --write',
<% } -%>
<% if (features.testing) { -%>
  '*.{js,ts}': 'vitest related --run',
<% } -%>
};
