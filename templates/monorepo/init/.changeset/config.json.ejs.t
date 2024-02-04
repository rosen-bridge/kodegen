---
to: "<%= features.changesets ? `./${monorepoName}/.changeset/config.json` : null %>"
---
{
  "$schema": "https://unpkg.com/@changesets/config@3.0.0/schema.json",
  "changelog": "@rosen-bridge/changeset-formatter",
  "commit": false,
  "fixed": [],
  "linked": [],
  "access": "public",
  "baseBranch": "dev",
  "updateInternalDependencies": "patch",
  "ignore": []
}
