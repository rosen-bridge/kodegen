module.exports = async ({ prompter }) => {
  const { serviceName } = await prompter.prompt({
    type: 'input',
    name: 'serviceName',
    message: 'Please enter the name of service',
  });
  const rest = await prompter.prompt([
    {
      type: 'input',
      name: 'servicePath',
      message: `Please enter the path to the service (default: ./services/${serviceName})`,
      initial: `./services/${serviceName}`,
    },
    {
      type: 'input',
      name: 'description',
      message: 'Please enter a description for your service',
    },
    {
      type: 'input',
      name: 'repo',
      message: 'Please enter the service repo url',
    },
    {
      type: 'input',
      name: 'author',
      message: 'Please enter the service author',
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
      ],
      name: 'features',
      message:
        'Which of the following features you want to enable? (Use space key to select/deselect)',
      result(names) {
        return this.map(names);
      },
    },
  ]);
  return { ...rest, serviceName };
};
