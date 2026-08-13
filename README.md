# Homebrew tap

This tap publishes formulas for `atacan` projects. Install CodeSplice with:

```console
brew install atacan/tap/codesplice
```

## Automated CodeSplice updates

After CodeSplice publishes a stable GitHub Release, its release workflow sends
the `codesplice_release_published` repository-dispatch event. The
`Update CodeSplice formula` workflow independently verifies the annotated tag,
stable release state, exact asset set, asset API digests, `SHA256SUMS`, both
archives, and the native binary version. It then updates the two supported
formula rows, audits and installs the formula on macOS arm64, and opens a pull
request from `automation/codesplice-vMAJOR.MINOR.PATCH`.

The workflow is idempotent for an already-current formula or an identical open
update PR. It refuses downgrades, checksum changes for an existing version,
unexpected automation-branch contents, and overlapping CodeSplice update PRs.
If PR creation failed after the verified branch was pushed, a manual rerun
validates that exact branch and creates the missing PR.

Repository setup:

1. Keep the default `GITHUB_TOKEN` permission restricted to read access.
   The workflow grants only `contents: write` and `pull-requests: write` to its
   job.
2. In **Settings > Actions > General > Workflow permissions**, enable
   **Allow GitHub Actions to create and approve pull requests**. The workflow
   creates PRs but never approves or merges them.
3. The dispatch credential lives only in `atacan/code-splice`; this repository
   needs no PAT secret.

If the cross-repository notification fails after a release is public, recover
without changing the release or tag:

```console
gh workflow run update-codesplice.yml \
  --repo atacan/homebrew-tap \
  --ref main \
  -f version=0.2.1
```
