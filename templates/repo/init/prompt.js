module.exports = {
  prompt: async ({ prompter }) => {
    const { projectName } = await prompter.prompt({
      type: 'input',
      name: 'projectName',
      message: 'Please enter the name of your project',
    });
    const rest = await prompter.prompt([
      {
        type: 'input',
        name: 'description',
        message: 'Please enter a description for your project',
      },
      {
        type: 'input',
        name: 'repo',
        message: 'Please enter the project repo url',
        initial: `git+https://github.com/rosen-bridge/${projectName}.git`,
      },
      {
        type: 'input',
        name: 'licenseOwner',
        message: 'Set the copyright owner name for license (e.g., your company or project name)',
        initial: `Rosen Bridge`,
      },
      {
        type: 'multiselect',
        choices: [
          {
            type: 'multiselect',
            message: 'select eslint and prettier features you want to enable:',
            choices: [
              { name: 'eslintFeaturesNode', message: 'node-specific globals' },
              { name: 'eslintFeaturesBrowser', message: 'browser-specific globals' },
              { name: 'eslintFeaturesReact', message: 'react-specific rules and plugins' },
            ],
          },
          {
        name: 'depcheck',
        message: 'Dependencies check',
      },
      {
        name: 'express',
        message: 'Express',
      },
      {
        name: 'ciCd',
        message: 'CI/CD support',
      },
      {
        name: 'testing',
        message: 'Testing (with coverage support)',
      },
      {
        name: 'logging',
        message: 'Logging',
      },
      {
        name: 'database',
        message: 'Database (with TypeORM)',
      },
      {
        name: 'changesets',
        message: 'Changesets',
      },
      {
        name: 'prerelease',
        message: 'Prerelease on opened merge request (and new commits to open MR)',
      },
        ],
      name: 'features',
      message:
        'Which of the following features you want to enable? (Use space key to select/deselect)',
        result(names) {
          return this.map(names);
        },
      },
    ]);
    return { ...rest, projectName };
  },
};
