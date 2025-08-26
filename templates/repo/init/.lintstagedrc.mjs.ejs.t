---
to: ./<%= projectName %>/.lintstagedrc.mjs
---
let tasks = {
<% if (features.depcheck) { -%>
  '**/{*.ts,*.js,package.json}': () => [`npx depcheck .`],
<% } -%>
};

if (!process.env.CI) {
  tasks = {
    '*.ts': () => 'tsc --noEmit',
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
    ...tasks,
  };
}

export default tasks;
