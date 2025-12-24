---
to: "<%= (features.ciCdGitlabCi || features.ciCdGitlabSnapshot) ? `./${monorepoName}/.gitlab-ci.yml` : null %>"
---
image: $GITLAB_CI_IMAGE

default:
  interruptible: true

workflow:
  rules:
    - if: '$CI_PIPELINE_SOURCE =~ /push<% if (features.ciCdGitlabSnapshot) { %>|web/<% } %>'
      when: always
    - when: never

include:
  - component: $CI_SERVER_FQDN/${ROOT_COMPONENT}

<% if (features.ciCdGitlabCi || features.ciCdGitlabSnapshot) { -%>
    inputs:
<% } -%>
<% if (features.ciCdGitlabCi) { -%>
      enable_ci_child: true
<% } -%>
<% if (features.ciCdGitlabSnapshot) { -%>
      enable_snapshot_publish_child: true
<% } -%>