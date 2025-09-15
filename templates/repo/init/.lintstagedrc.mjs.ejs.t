---
to: ./<%= projectName %>/.lintstagedrc.mjs
---
import process from 'node:process';

let tasks = {
<% if (features.depcheck) { -%>
  '**/{*.ts,*.js,package.json}': () => [`npx depcheck .`],
<% } -%>
};

if (!process.env.CI) {
  tasks = {
    '*.ts': () => 'tsc --noEmit',
<% if ((features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) && features.testing) { -%>
    '*.{js,ts}': ['eslint --fix', 'vitest related --run'],
<% } else if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    '*.{js,ts}': 'eslint --fix',
<% } else if (features.testing) { -%>
    '*.{js,ts}': 'vitest related --run',
<% } -%>
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
    '*': 'prettier --ignore-unknown --write',
<% } -%>
    ...tasks,
  };
}

export default tasks;
