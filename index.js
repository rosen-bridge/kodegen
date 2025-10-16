const { runner , printHelp } = require('hygen');
const Logger = require('hygen/dist/logger');
const fs = require('fs');
const path = require('path');
const defaultTemplates = path.join(__dirname, 'templates');
const execa = require('execa');

const packageJson = require('./package.json');

if (['--version', '-v'].includes(process.argv[2])) {
  console.log(packageJson.version);
  process.exit(0);
}

if (process.argv.includes('--help') || process.argv.includes('-h')) {
  printHelp(templates = defaultTemplates, new Logger.default(console.log.bind(console)));
      console.log(`\nExamples:
    npx kodegen monorepo init

    In monorepo root:
      - npx kodegen monorepo add-package
      - npx kodegen monorepo add-service

    npx kodegen repo init

  For more information, visit:
    https://github.com/rosen-bridge/kodegen
`);
  process.exit(0);
}

runner(process.argv.slice(2), {
  templates: defaultTemplates,
  cwd: process.cwd(),
  logger: new Logger.default(console.log.bind(console)),
  createPrompter: () => require('enquirer'),
  exec: (action, body) => {
    const opts = body && body.length > 0 ? { input: body } : {};
    return execa(action, undefined, { shell: true });
  },
  debug: true,
  helpers: {
    rootHasEslint: (() => {
      const configFiles = [
        'eslint.config.js',
        'eslint.config.mjs',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.json',
        '.eslintrc.yaml',
        '.eslintrc.yml',
      ];
      return configFiles.some(file => fs.existsSync(path.join(process.cwd(), file)));
    })()
  }
});
