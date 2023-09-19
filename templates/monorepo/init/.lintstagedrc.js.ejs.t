---
to: ./<%= monorepoName %>/.lintstagedrc.js
---
export default {
  '*.ts': () => 'npm run type-check',
<% if (features.prettierEslint && features.testing) { -%>
  '*.{js,ts}': ['eslint --fix', 'vitest related --run'],
<% } else if (features.prettierEslint) { -%>
  '*.{js,ts}': 'eslint --fix',
<% } else if (features.testing) { -%>
  '*.{js,ts}': 'vitest related --run',
<% } -%>
<% if (features.prettierEslint) { -%>
  '*': 'prettier --ignore-unknown --write',
<% } -%>
};
