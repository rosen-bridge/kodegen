---
to: ./<%= projectName %>/.lintstagedrc.mjs
---
const tasks = {
  '*.ts': () => 'npm run type-check',
};

<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
tasks['*'] = ['prettier --ignore-unknown --write'];
tasks['*.{js,ts}'] = ['eslint --fix'];
<% } -%>

<% if (features.testing) { -%>
if (tasks['*.{js,ts}']) {
  tasks['*.{js,ts}'].push('vitest related --run');
} else {
  tasks['*.{js,ts}'] = ['vitest related --run'];
}
<% } -%>

<% if (features.knip) { -%>
if (tasks['*']) {
  tasks['*'].push(() => 'npx knip --dependencies');
} else {
  tasks['*'] = [() => 'npx knip --dependencies'];
}
<% } -%>

export default tasks;
