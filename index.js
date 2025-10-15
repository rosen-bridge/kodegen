const { runner } = require('hygen');
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
  console.log('\nkodegen help\n');
  const generatorsDir = path.join(__dirname, 'templates');
    const generators = fs.readdirSync(generatorsDir);
    if (generators.length === 0) {
      console.log('No generators found in templates/');
    } else {
      generators.forEach(gen => {
        const actionsPath = path.join(generatorsDir, gen);
        if (fs.statSync(actionsPath).isDirectory()) {
          const actions = fs.readdirSync(actionsPath);
          console.log(`\n${gen}:`);
          actions.forEach(a => {
            const actionPath = path.join(actionsPath, a);
            if (fs.statSync(actionPath).isDirectory()) {
              console.log(`  - ${gen} ${a}`);
            }
          });
        }
      });
    }
    console.log('\nExamples:\n');
    console.log('  npx kodegen monorepo init\n');
    console.log('  in monorepo root:\n        - npx kodegen monorepo add-package  \n        - npx kodegen monorepo add-service');
    console.log('\n  npx kodegen repo init');
    console.log('\nFor more information, visit Documentation: https://github.com/rosen-bridge/kodegen\n'); 
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
