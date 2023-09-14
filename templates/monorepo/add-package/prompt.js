module.exports = async ({ prompter }) => {
  const { packageName } = await prompter.prompt({
    type: 'input',
    name: 'packageName',
    message: 'Please enter the name of package',
  });
  const rest = await prompter.prompt([
    {
      type: 'input',
      name: 'packagePath',
      message: `Please enter the path to the package (default: ./packages/${packageName})`,
      initial: `./packages/${packageName}`,
    },
    {
      type: 'input',
      name: 'description',
      message: 'Please enter a description for your package',
    },
    {
      type: 'input',
      name: 'repo',
      message: 'Please enter the package repo url',
    },
    {
      type: 'input',
      name: 'author',
      message: 'Please enter the package author',
    },
    {
      type: 'multiselect',
      choices: [
        {
          name: 'prettierEslint',
          message: 'Prettier and Eslint',
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
  ]);
  return { ...rest, packageName };
};
