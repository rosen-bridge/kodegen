# kodegen

A code generator for JavaScript/TypeScript projects that helps you bootstrap monorepos, services, and packages with best practices and modern tooling.

## 🚀 Features

### Project Scaffolding
- **Monorepo Initialization**: Create full-featured monorepos with workspaces
- **Service Generation**: Generate microservices with various feature combinations
- **Package Creation**: Create reusable packages within monorepos
- **Single Repository Setup**: Initialize standalone projects

### Technology Stack Support
- **TypeScript** with modern configuration
- **Express.js** for web services
- **TypeORM** with SQLite for database operations
- **Testing** with Vitest and coverage reporting
- **Logging** with Winston and custom logger integration
- **CI/CD** with GitLab CI templates

### Development Tools
- **ESLint** with configurable rules (Node.js, Browser, React)
- **Prettier** with import sorting
- **Husky** for git hooks
- **lint-staged** for pre-commit checks
- **Changesets** for version management
- **knip** for dependency validation
- **madge** for circular dependency

## 📦 Installation

```bash
npm install -g kodegen
```

Or use directly with npx:

```bash
npx kodegen [command]
```

## 🛠️ Usage

### Monorepo Commands

#### Initialize a new monorepo
```bash
npx kodegen monorepo init
```

This creates a monorepo with:
- Workspace configuration
- TypeScript base config
- ESLint and Prettier setup
- Git hooks with Husky
- CI/CD pipeline (optional)
- Testing setup (optional)
- Changesets support (optional)

#### Add a new package to monorepo
```bash
npx kodegen monorepo add-package
```

Creates a reusable package with:
- TypeScript build configuration
- Testing setup (optional)
- Proper package.json structure
- README template

#### Add a new service to monorepo
```bash
npx kodegen monorepo add-service
```

Generates a service with selectable features:
- Express.js API
- Database (TypeORM + SQLite)
- Logging system
- Testing setup
- Configuration management

### Single Repository Commands

#### Initialize a standalone project
```bash
npx kodegen repo init
```

Creates a single repository with similar feature options as monorepo services.

## 🎯 Available Features

### Development Features
- **ESLint Configurations**: Node.js, Browser, and React-specific rules
- **Prettier with Import Sorting**: Automated code formatting
- **TypeScript**: Strict configuration with path aliases
- **Testing**: Vitest with Istanbul coverage
- **Git Hooks**: Pre-commit validation with lint-staged

### Infrastructure Features
- **CI/CD**: GitLab CI pipeline templates
- **Version Management**: Changesets for semantic versioning
- **Dependency Checking**: knip integration
- **Circular Dependency**: madge integration
- **Logging**: Structured logging with Winston
- **Database**: TypeORM with migrations support

### Service Features
- **Express.js**: REST API framework
- **Configuration**: YAML-based config with `config` package
- **Database**: SQLite with TypeORM entities and migrations
- **Logging**: File-based logging with rotation


## 🔧 Configuration

### Monorepo Features
When initializing a monorepo, you can select from:
- ESLint features (Node, Browser, React)
- CI/CD pipeline setup
- Testing with coverage
- Changesets for versioning
- Dependency checking

### Service Features
When creating a service, choose from:
- Express.js web framework
- Database with TypeORM
- Logging system
- Testing setup

## 🚀 Quick Start

1. **Create a new monorepo**:
   ```bash
   npx kodegen monorepo init
   ```

2. **Add your first service**:
   ```bash
   cd your-monorepo
   npx kodegen monorepo add-service
   ```

3. **Add a shared package**:
   ```bash
   npx kodegen monorepo add-package
   ```

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🔍 Version Information

Check the current version:
```bash
npx kodegen --version
# or
npx kodegen -v
```
