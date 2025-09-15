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
    })(),

    rootIgnorePath: (workspacePath) => {
      const candidates = ['.prettierignore', '.gitignore'];
      const rootFile = candidates.find(file => fs.existsSync(path.join(process.cwd(), file)));
      if (!rootFile) return null;
      const normalizedWorkspacePath = workspacePath.replace('./', '');
      const depth = normalizedWorkspacePath.split('/').length;
      const relativePath = '../'.repeat(depth) + rootFile;
      return relativePath;
    }
  }
});
