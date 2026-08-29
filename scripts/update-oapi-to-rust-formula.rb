#!/usr/bin/env ruby
# frozen_string_literal: true

# Deterministically writes or updates Formula/oapi-to-rust.rb from verified
# release checksums. The caller (the update-oapi-to-rust workflow) is
# responsible for independently verifying the upstream GitHub Release before
# invoking this script — this script trusts the digests it is given.
#
# Usage:
#   update-oapi-to-rust-formula.rb VERSION MACOS_ARM_SHA MACOS_INTEL_SHA LINUX_ARM_SHA LINUX_INTEL_SHA
#
# If Formula/oapi-to-rust.rb does not exist yet, it is created from scratch
# (the bootstrap case: there is no earlier release to update from). If it
# exists, exactly its four url/sha256 pairs are updated in place; everything
# else in the file is left untouched.

FORMULA = File.expand_path(ENV.fetch("OAPI_TO_RUST_FORMULA", "../Formula/oapi-to-rust.rb"), __dir__)
UPSTREAM_REPO = "atacan/rust-openapi-generator"
UPSTREAM = "https://github.com/#{UPSTREAM_REPO}/releases/download"

# Declaration order doubles as the emission order in a freshly bootstrapped
# formula, matching the on_macos/on_arm/on_intel/on_linux/on_arm/on_intel
# structure required of this formula.
TARGETS = [
  ["macos_arm", "aarch64-apple-darwin"],
  ["macos_intel", "x86_64-apple-darwin"],
  ["linux_arm", "aarch64-unknown-linux-gnu"],
  ["linux_intel", "x86_64-unknown-linux-gnu"],
].freeze
TARGET_TRIPLES = TARGETS.map { |_, triple| triple }.freeze

def fail!(message)
  warn "update-oapi-to-rust-formula: #{message}"
  exit 1
end

def parse_version(value)
  stable_component = /(?:0|[1-9]\d*)/
  stable_version = /\A#{stable_component}\.#{stable_component}\.#{stable_component}\z/
  fail!("version must be stable MAJOR.MINOR.PATCH without a v prefix") unless value.match?(stable_version)

  value.split(".").map(&:to_i)
end

def valid_digest?(value)
  value.match?(/\A[0-9a-f]{64}\z/)
end

def render_formula(version, digests)
  macos_arm_url = "#{UPSTREAM}/v#{version}/oapi-to-rust-v#{version}-aarch64-apple-darwin.tar.gz"
  macos_intel_url = "#{UPSTREAM}/v#{version}/oapi-to-rust-v#{version}-x86_64-apple-darwin.tar.gz"
  linux_arm_url = "#{UPSTREAM}/v#{version}/oapi-to-rust-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
  linux_intel_url = "#{UPSTREAM}/v#{version}/oapi-to-rust-v#{version}-x86_64-unknown-linux-gnu.tar.gz"

  <<~RUBY
    class OapiToRust < Formula
      desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
      homepage "https://github.com/#{UPSTREAM_REPO}"

      on_macos do
        on_arm do
          url "#{macos_arm_url}"
          sha256 "#{digests.fetch("macos_arm")}"
        end

        on_intel do
          url "#{macos_intel_url}"
          sha256 "#{digests.fetch("macos_intel")}"
        end
      end

      on_linux do
        on_arm do
          url "#{linux_arm_url}"
          sha256 "#{digests.fetch("linux_arm")}"
        end

        on_intel do
          url "#{linux_intel_url}"
          sha256 "#{digests.fetch("linux_intel")}"
        end
      end

      def install
        bin.install "oapi-to-rust"
      end

      test do
        assert_match version.to_s, shell_output("\#{bin}/oapi-to-rust --version")
      end
    end
  RUBY
end

fail!("usage: #{$PROGRAM_NAME} VERSION MACOS-ARM-SHA256 MACOS-INTEL-SHA256 LINUX-ARM-SHA256 LINUX-INTEL-SHA256") unless ARGV.length == 5

version, macos_arm_digest, macos_intel_digest, linux_arm_digest, linux_intel_digest = ARGV
requested_version = parse_version(version)
requested_digests = {
  "macos_arm" => macos_arm_digest,
  "macos_intel" => macos_intel_digest,
  "linux_arm" => linux_arm_digest,
  "linux_intel" => linux_intel_digest,
}
requested_digests.each do |key, digest|
  fail!("invalid #{key} SHA-256 digest") unless valid_digest?(digest)
end

# Bootstrap: no earlier release to update from, so write the formula fresh.
# NOTE: this is the ONLY place a URL for an unreleased version could ever be
# written, and it is only reached once the caller has already verified the
# named release actually exists with these exact digests.
unless File.file?(FORMULA)
  File.write(FORMULA, render_formula(version, requested_digests))
  puts "Created initial Formula/oapi-to-rust.rb for #{version}"
  exit 0
end

source = File.binread(FORMULA)
formula_urls = source.scan(/^\s*url "([^"]+)"$/).flatten.grep(%r{/#{Regexp.escape(UPSTREAM_REPO)}/})
fail!("expected exactly #{TARGETS.length} oapi-to-rust URLs, found #{formula_urls.length}") unless formula_urls.length == TARGETS.length

current = {}
formula_urls.each do |url|
  match = url.match(%r{\A#{Regexp.escape(UPSTREAM)}/v((?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*))/oapi-to-rust-v\1-([^/]+)\.tar\.gz\z})
  fail!("unexpected oapi-to-rust URL: #{url}") unless match

  current_version, triple = match.captures
  fail!("unexpected oapi-to-rust target: #{triple}") unless TARGET_TRIPLES.include?(triple)
  key, = TARGETS.find { |_, t| t == triple }
  fail!("duplicate oapi-to-rust target: #{triple}") if current.key?(key)

  digest_match = source.match(/url "#{Regexp.escape(url)}"\n\s+sha256 "([0-9a-f]{64})"/)
  fail!("missing canonical checksum immediately after #{triple} URL") unless digest_match
  current[key] = { version: current_version, digest: digest_match[1], url: url }
end

fail!("formula target set is incomplete") unless current.keys.sort == TARGETS.map(&:first).sort
current_versions = current.values.map { |entry| entry[:version] }.uniq
fail!("formula targets disagree on their current version") unless current_versions.length == 1

current_version = current_versions.fetch(0)
comparison = requested_version <=> parse_version(current_version)
fail!("refusing to downgrade #{current_version} to #{version}") if comparison.negative?

if comparison.zero?
  mismatches = current.keys.select { |key| current[key][:digest] != requested_digests.fetch(key) }
  fail!("release #{version} already exists with different checksums") unless mismatches.empty?

  puts "oapi-to-rust formula already matches #{version}"
  exit 0
end

updated = source.dup
current.each do |key, entry|
  triple = TARGETS.find { |k, _| k == key }.fetch(1)
  new_url = "#{UPSTREAM}/v#{version}/oapi-to-rust-v#{version}-#{triple}.tar.gz"
  old_pair = %(url "#{entry[:url]}"\n      sha256 "#{entry[:digest]}")
  new_pair = %(url "#{new_url}"\n      sha256 "#{requested_digests.fetch(key)}")
  fail!("could not locate the canonical #{triple} URL/checksum pair") unless updated.scan(old_pair).length == 1

  updated.sub!(old_pair, new_pair)
end

fail!("formula update unexpectedly made no changes") if updated == source
File.binwrite(FORMULA, updated)
puts "Updated oapi-to-rust formula from #{current_version} to #{version}"
