---
to: "<%= features.ciCdGitlabCi ? `./${projectName}/.gitlab-ci.yml` : null %>"
---

image: $GITLAB_CI_IMAGE

default:
  interruptible: true

include:
  - component: $CI_SERVER_FQDN/${ROOT_COMPONENT}

    inputs:
      install_cache_paths:
        - node_modules
      enable_build: false
      enable_ci_child: true
