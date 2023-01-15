---
to: "<%= features.semanticRelease ? `./${projectName}/.releaserc` : null %>"
---
{
  "branches": [
    "master",
    "next"
  ],
  "plugins": [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    "@semantic-release/npm",
    [
      "@semantic-release/git",
      {
        "assets": [
          "package.json"
        ],
        "message": "chore: Upgrade to version ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
      }
    ]
  ]
}
