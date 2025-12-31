---
to: "<%= features.ciCdGitlabSnapshot ? `./${monorepoName}/.gitlab/workflows/snapshot-publish.yml` : null %>"
---
image: node:$GITLAB_CI_IMAGE

default:
  interruptible: true

include:
  - component: $CI_SERVER_FQDN/${SNAPSHOT_COMPONENT}

<% if (features.discordAnnounce) { -%>
    inputs:
      enable_announce: true
<% } -%>
