---
to: ./<%= monorepoName %>/.lintstagedrc.mjs
---
<% if (features.depcheck) { -%>
import fs from 'node:fs';
import path from 'node:path';

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
<% if (features.depcheck) { -%>
  '**/{*.ts,*.js,package.json}': perPackage((directory) => {
    return `npx depcheck ${path.relative(
      process.cwd(),
      directory
    )}`;
  }),
<% } -%>
};

if (!process.env.CI) {
  tasks = {
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
    ...tasks,
  };
}

export default tasks;
