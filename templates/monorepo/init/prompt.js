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
    _changesetsEnabled: false,
    _publishEnabled: false,
    choices() {
      const includePublish = this._changesetsEnabled;
      const includeAnnounce = this._publishEnabled;

      const baseCiCdChoices = [
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
      ];

      const publishCiCdChoices = [
        {
          type: 'multiselect',
          name: 'ciCdContinuousDelivery',
          message: 'Continuous Delivery support',
          choices: [
            {
              name: 'ciCdStablePublish',
              message: 'Github Stable Publish',
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
      ];

      const announceChoices = includeAnnounce
        ? [
            {
              name: 'discordAnnounce',
              message: 'Discord announce for publish pipelines',
            },
          ]
        : [];

      return [
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
          type: 'multiselect',
          name: 'ciCd',
          message: 'CI/CD support',
          choices: includePublish ? baseCiCdChoices.concat(publishCiCdChoices) : baseCiCdChoices,
        },
      ].concat(announceChoices);
    },
    name: 'features',
    message:
      'Which of the following features you want to enable? (Use space key to select/deselect)',
    async space() {
      const choice = this.focused;
      this.toggle(choice);

      const resetAndReEnable = async names => {
        await this.reset();

        for (const name of names) {
          const nextChoice = this.find(name);
          if (nextChoice) this.enable(nextChoice);
        }
      };

      selectedNames = this.enabled.map(ch => ch.name);
      const nextChangesetsEnabled = selectedNames.includes('changesets');

      if (this._changesetsEnabled !== nextChangesetsEnabled) {
        this._changesetsEnabled = nextChangesetsEnabled;
        await resetAndReEnable(selectedNames);
      }

      selectedNames = this.enabled.map(ch => ch.name);
      const nextPublishEnabled =
        selectedNames.includes('ciCdStablePublish') ||
        selectedNames.includes('ciCdGitlabSnapshot') ||
        selectedNames.includes('ciCdGithubActionsSnapshot');

      if (this._publishEnabled !== nextPublishEnabled) {
        this._publishEnabled = nextPublishEnabled;
        await resetAndReEnable(selectedNames);
      }

      return this.render();
    },
    result(names) {
      return this.map(names);
    },
  },
];
