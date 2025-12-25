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

<% if (features.knip) { -%>
if (tasks['*']) {
  tasks['*'].push(() => 'knip --dependencies');
} else {
  tasks['*'] = [() => 'knip --dependencies'];
}
<% } -%>

export default tasks;
