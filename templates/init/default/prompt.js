module.exports = [
  {
    type: 'input',
    name: 'projectName',
    message: 'Please enter the name of your project',
  },
  {
    type: 'input',
    name: 'description',
    message: 'Please enter a description for your project',
  },
  {
    type: 'input',
    name: 'repo',
    message: 'Please enter the project repo url',
  },
  {
    type: 'multiselect',
    choices: [
      {
        name: 'prettierEslint',
        message: 'Prettier and Eslint',
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
];
