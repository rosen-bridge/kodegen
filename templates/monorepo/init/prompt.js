module.exports = [
  {
    type: 'input',
    name: 'monorepoName',
    message: 'Please enter the name of monorepo',
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
        name: 'ciCd',
        message: 'CI/CD support',
      },
      {
        name: 'testing',
        message: 'Testing (with coverage support)',
      },
      {
        name: 'changesets',
        message: 'Changesets',
      },
      {
        name: 'knip',
        message: 'Dependencies check',
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
