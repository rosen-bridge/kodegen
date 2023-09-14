const fs = require('fs');

const prompt = require('./prompt');

const PACKAGE_JSON = 'package.json';

const exitProcessDueToAbsentMonorepo = () => {
  console.error(
    'You should run this command in a monorepo root. You can create one by calling `npx kodegen monorepo init`.'
  );
  process.exit(1);
};

const getCWDPackageJson = () => {
  if (!fs.existsSync(PACKAGE_JSON)) {
    return null;
  }

  const packageJsonString = fs.readFileSync(PACKAGE_JSON, {
    encoding: 'utf-8',
  });

  return JSON.parse(packageJsonString);
};

module.exports = {
  prompt: (...args) => {
    const packageJson = getCWDPackageJson();

    if (!packageJson?.workspaces) {
      exitProcessDueToAbsentMonorepo();
    }

    return prompt(...args);
  },
};
