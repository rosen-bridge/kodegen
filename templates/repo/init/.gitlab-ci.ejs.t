---
to: "<%= features.ciCd ? `./${projectName}/.gitlab-ci.yml` : null %>"
---
image: node:22.18.0

stages:
  - installation
<% if (features.knip) { -%>
  - knip
<% } -%>
  - type-check
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>
  - lint
<% } -%>
<% if (features.testing) { -%>
  - test
<% } -%>
<% if (features.prerelease) { -%>
  - publish
<% } -%>
<% if (features.changesets) { -%>
  - changeset
<% } -%>

installation:
  stage: installation
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: push
    paths:
      - node_modules
  script:
    - npm ci

<% if (features.knip) { -%>
knip:
  stage: knip
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
      - '**/node_modules'
  script:
    - knip --dependencies
<% } -%>

type-check:
  stage: type-check
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run type-check
<% if (features.eslintFeaturesNode || features.eslintFeaturesBrowser || features.eslintFeaturesReact) { -%>

lint:
  stage: lint
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run lint:check
<% } -%>
<% if (features.testing) { -%>

test:
  stage: test
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run coverage
  coverage: '/All files[^|]*\|[^|]*\s+([\d\.]+)/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: coverage/cobertura-coverage.xml
<% } -%>
<% if (features.prerelease) { -%>

publish:
  stage: publish
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    # change the patch part of the version,
    - npm version patch --no-git-tag-version > /dev/null
    # then add alpha tag and the hash, indicating a pre-release
    - npm version `node -p -e "require('./package.json').version"`-alpha-`git rev-parse --short HEAD` --no-git-tag-version
    - npm publish
  only:
    - merge_requests
<% } -%>
<% if (features.changesets) { -%>

changeset:
  stage: changeset
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  before_script:
    - git fetch origin dev
  script:
    - npx changeset status --since=origin/dev
<% } -%>
