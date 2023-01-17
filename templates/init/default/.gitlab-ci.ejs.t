---
to: "<%= features.ciCd ? `./${projectName}/.gitlab-ci.yml` : null %>"
---
image: node:18.12

stages:
  - installation
  - type-check
<% if (features.prettierEslint) { -%>
  - lint
<% } -%>
<% if (features.testing) { -%>
  - test
<% } -%>
<% if (features.prerelease) { -%>
  - publish
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

type-check:
  stage: type-check
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run type-check
<% if (features.prettierEslint) { -%>

lint:
  stage: lint
  cache:
    key: $CI_COMMIT_REF_NAME
    policy: pull
    paths:
      - node_modules
  script:
    - npm run lint
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
    - npm publishg
  only:
    - merge_requests
<% } -%>
