---
to: ./<%= monorepoName %>/.lintstagedrc.mjs
---
<% if (features.knip) { -%>
import fs from 'node:fs';
import path from 'node:path';
import process from 'node:process';

const perPackage = (resolver) => (files) => {
  return Array.from(
    files.reduce((packages, file) => {
      let directory = path.dirname(file);

      while (directory && directory !== process.cwd()) {
        if (fs.existsSync(path.join(directory, 'package.json'))) {
          packages.add(resolver(directory, file));
          break;
        }
        const parent = path.dirname(directory);
        if (parent === directory) break;
        directory = parent;
      }
      return packages;
    }, new Set())
  );
};

<% } -%>

let tasks = {
<% if (features.knip) { -%>
  '**/{*.ts,*.js,package.json}': perPackage((directory) => {
    return `cd ${path.relative(process.cwd(), directory)} && npx knip --dependencies`;
  }),
<% } -%>
};

if (!process.env.CI) {
  tasks = {
    '*.ts': () => 'npm run type-check',
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
