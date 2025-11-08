const fs = require('fs');
const path = require('path');

const prompt = require('./prompt');

const PACKAGE_JSON = 'package.json';

/**
 * log an error and exits process because current working directory is not a
 * monorepo root path
 */
const exitProcessDueToAbsentMonorepo = () => {
  console.error(
    'You should run this command in a monorepo root. You can create one by calling `npx kodegen monorepo init`.'
  );
  process.exit(1);
};

/**
 * get package json object of current working directory or `null` if no package
 * file is found
*/
const getCWDPackageJson = () => {
  if (!fs.existsSync(PACKAGE_JSON)) return null;
  try {
    const json = fs.readFileSync(PACKAGE_JSON, 'utf-8');
    return JSON.parse(json);
  } catch {
    return null;
  }
};

/**
 * Check if monorepo root has vitest.shared.ts
 */
const monorepoHasTesting = () => {
  const rootVitestPath = path.join(process.cwd(), 'vitest.shared.ts');
  return fs.existsSync(rootVitestPath);
};

module.exports = {
  prompt: async (...args) => {
    const packageJson = getCWDPackageJson();
    if (!packageJson?.workspaces) {
      exitProcessDueToAbsentMonorepo();
    }

    const answers = await prompt(...args);
    if (answers.testing && !monorepoHasTesting()) {
      console.error(
        '\nError: This monorepo does not have "vitest.shared.ts" in its root, so testing cannot be enabled for this package.\n' +
        'Please reinitialize the monorepo with testing enabled or disable testing for this package.\n'
      );
      process.exit(1);
    }

    return answers;
  },
};
