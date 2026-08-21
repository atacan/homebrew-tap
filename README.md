# Homebrew tap

This tap publishes formulas for `atacan` projects. Install srcmv with:

```console
brew install atacan/tap/srcmv
```

## Automated srcmv updates

After srcmv publishes a stable GitHub Release, its release workflow sends the
`srcmv_release_published` repository-dispatch event. The
`Update srcmv formula` workflow independently verifies the annotated tag,
stable release state, exact asset set, asset API digests, `SHA256SUMS`, both
archives, and the native binary version. It then updates the two supported
formula rows, audits and installs the formula on macOS arm64, and opens a pull
request from `automation/srcmv-vMAJOR.MINOR.PATCH`.

The workflow is idempotent for an already-current formula or an identical open
update PR. It refuses downgrades, checksum changes for an existing version,
unexpected automation-branch contents, and overlapping srcmv update PRs. It
fails explicitly while the initial `Formula/srcmv.rb` is absent; merge that
formula first, then rerun. If PR creation failed after the verified branch was
pushed, a manual rerun validates that exact branch and creates the missing PR.

Repository setup:

1. Keep the default `GITHUB_TOKEN` permission restricted to read access.
   The workflow grants only `contents: write` and `pull-requests: write` to its
   job.
2. In **Settings > Actions > General > Workflow permissions**, enable
   **Allow GitHub Actions to create and approve pull requests**. The workflow
   creates PRs but never approves or merges them.
3. The dispatch credential lives only in `atacan/srcmv`; this repository
   needs no PAT secret.

If the cross-repository notification fails after a release is public, recover
without changing the release or tag:

```console
gh workflow run update-srcmv.yml \
  --repo atacan/homebrew-tap \
  --ref main \
  -f version=0.4.0
```
