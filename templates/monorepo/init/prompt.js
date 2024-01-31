module.exports = [
  {
    type: 'input',
    name: 'monorepoName',
    message: 'Please enter the name of monorepo',
  },
  {
    type: 'multiselect',
    choices: [
      {
        name: 'prettierEslint',
        message: 'Prettier and Eslint',
      },
      {
        name: 'ciCd',
        message: 'CI/CD support',
      },
      {
        name: 'testing',
        message: 'Testing (with coverage support)',
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
