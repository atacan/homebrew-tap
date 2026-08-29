# Homebrew tap

This tap publishes formulas for `atacan` projects. Install srcmv with:

```console
brew install atacan/tap/srcmv
```

Install oapi-to-rust with:

```console
brew install atacan/tap/oapi-to-rust
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

## Automated oapi-to-rust updates

After `atacan/rust-openapi-generator` publishes a stable GitHub Release, its
release workflow sends the `oapi_to_rust_release_published` repository-dispatch
event. The `Update oapi-to-rust formula` workflow independently verifies the
tag (annotated or lightweight), stable release state, exact five-asset set
(`SHA256SUMS` plus the four platform archives), asset API digests,
`SHA256SUMS` contents, all four archives, and each archive's `oapi-to-rust`
executable contents — the dispatch payload is treated only as a hint. It then
writes or updates `Formula/oapi-to-rust.rb` for all four platforms
(`aarch64`/`x86_64` × macOS/Linux), audits/installs/tests the formula on
macOS arm64, and opens a pull request from
`automation/oapi-to-rust-vMAJOR.MINOR.PATCH`.

The same workflow handles both the very first release (writing
`Formula/oapi-to-rust.rb` from scratch — there is nothing to invent fake
checksums for; the formula only comes into existence once a real, fully
verified release exists) and every subsequent version bump. It is idempotent
for an already-current formula or an identical open update PR, refuses
downgrades and checksum changes for an existing version, and refuses to
proceed if a differently-versioned update PR is already open.

**Bootstrap dependency:** `Formula/oapi-to-rust.rb` does not exist in this
repository until `atacan/rust-openapi-generator` has published its first
stable tag (e.g. `v0.1.0`) and this workflow has run once — either
automatically via the dispatch, or manually:

```console
gh workflow run update-oapi-to-rust.yml \
  --repo atacan/homebrew-tap \
  --ref main \
  -f version=0.1.0
```

Repository setup:

1. Keep the default `GITHUB_TOKEN` permission restricted to read access.
   The workflow grants only `contents: write` and `pull-requests: write` to
   its job.
2. In **Settings > Actions > General > Workflow permissions**, enable
   **Allow GitHub Actions to create and approve pull requests**. The workflow
   creates PRs but never approves or merges them.
3. The dispatch credential (a token with `Contents: write` permission scoped
   to `atacan/rust-openapi-generator`, stored there as `HOMEBREW_TAP_TOKEN`)
   lives only in that repository; this repository needs no PAT secret.
