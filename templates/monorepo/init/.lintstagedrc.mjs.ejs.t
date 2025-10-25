---
to: ./<%= monorepoName %>/.lintstagedrc.mjs
---

<% if (features.knip) { -%>
import fs from 'fs';
import path from 'path';

const perPackage = (resolver) => (files) => {
  return Array.from(
    files.reduce((packages, file) => {
      let directory = path.dirname(path.resolve(file));
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
    }, new Set()),
  );
};

const getKnipCommand = (dir) => {
  const posixRelative = path.posix.relative(process.cwd(), dir);
  return `npx knip --dependencies --workspace ${posixRelative}`;
};

const runKnipConditional = (files) => {
  const rootChanged = files.some((f) => {
    const relative = path.relative(process.cwd(), path.resolve(f));
    return !relative.includes(path.sep);
  });
  if (rootChanged) {
    return ['npx knip --dependencies'];
  } else {
    return perPackage(getKnipCommand)(files);
  }
};
<% } -%>

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
  tasks['*'].push(runKnipConditional);
} else {
  tasks['*'] = [runKnipConditional];
}
<% } -%>

export default tasks;
