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
      {
        name: 'circularCheck',
        message: 'Circular dependency check',
      },
      {
        name: 'discordAnnounce',
        message: 'Discord announce for publish pipelines',
      },
      {
        type: 'multiselect',
        name: 'ciCd',
        message: 'CI/CD support',
        choices: [
          {
            type: 'multiselect',
            name: 'ciCdContinuousIntegration',
            message: 'Continuous Integration support',
            choices: [
              {
                name: 'ciCdGitlabCi',
                message: 'GitLab CI',
              },
              {
                name: 'ciCdGithubActionsCi',
                message: 'GitHub Actions',
              },
            ],
          },

          {
            type: 'multiselect',
            name: 'ciCdContinuousDelivery',
            message: 'Continuous Delivery support',
            choices: [
              {
                name: 'ciCdStablePublish',
                message: 'Stable publish (release)',
              },
              {
                type: 'multiselect',
                name: 'ciCdSnapshotPublish',
                message: 'Snapshot publish (Prerelease)',
                choices: [
                  {
                    name: 'ciCdGitlabSnapshot',
                    message: 'GitLab CI',
                  },
                  {
                    name: 'ciCdGithubActionsSnapshot',
                    message: 'GitHub Actions',
                  },
                ],
              },
            ],
          },
        ],
      },
    ],
    name: 'features',
    message:
      'Which of the following features you want to enable? (Use space key to select/deselect)',
    result(names) {
      const features = this.map(names);

      const usesStableOrSnapshotPublish =
        features.ciCdStablePublish ||
        features.ciCdGitlabSnapshot ||
        features.ciCdGithubActionsSnapshot;

      if (usesStableOrSnapshotPublish && !features.changesets) {
        throw new Error(
          'You cannot enable snapshot/stable publish without enabling Changesets feature.',
        );
      }

      return features;
    },
  },
];
