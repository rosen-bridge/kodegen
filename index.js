const { runner } = require('hygen');
const Logger = require('hygen/dist/logger');
const path = require('path');
const defaultTemplates = path.join(__dirname, 'templates');
const execa = require('execa');

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
});
