#!/usr/bin/env ruby
# frozen_string_literal: true

FORMULA = File.expand_path(ENV.fetch("SRCMV_FORMULA", "../Formula/srcmv.rb"), __dir__)
UPSTREAM = "https://github.com/atacan/srcmv/releases/download"
TARGETS = {
  "aarch64-apple-darwin" => :macos,
  "x86_64-unknown-linux-gnu" => :linux,
}.freeze

def fail!(message)
  warn "update-srcmv-formula: #{message}"
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

fail!("usage: #{$PROGRAM_NAME} MAJOR.MINOR.PATCH MACOS-SHA256 LINUX-SHA256") unless ARGV.length == 3

version, macos_digest, linux_digest = ARGV
requested_version = parse_version(version)
fail!("invalid macOS SHA-256 digest") unless valid_digest?(macos_digest)
fail!("invalid Linux SHA-256 digest") unless valid_digest?(linux_digest)

# The initial formula must be merged with verified release checksums before the
# updater can run; a missing formula is an explicit, recoverable condition.
fail!("#{FORMULA} is missing; merge the initial Formula/srcmv.rb first") unless File.file?(FORMULA)

source = File.binread(FORMULA)
formula_urls = source.scan(/^\s*url "([^"]+)"$/).flatten.grep(%r{/atacan/srcmv/})
fail!("expected exactly two srcmv URLs") unless formula_urls.length == TARGETS.length

current = {}
formula_urls.each do |url|
  match = url.match(%r{\A#{Regexp.escape(UPSTREAM)}/v((?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*))/srcmv-v\1-([^/]+)\.tar\.gz\z})
  fail!("unexpected srcmv URL: #{url}") unless match

  current_version, target = match.captures
  fail!("unexpected srcmv target: #{target}") unless TARGETS.key?(target)
  fail!("duplicate srcmv target: #{target}") if current.key?(target)

  digest_match = source.match(/url "#{Regexp.escape(url)}"\n\s+sha256 "([0-9a-f]{64})"/)
  fail!("missing canonical checksum immediately after #{target} URL") unless digest_match
  current[target] = { version: current_version, digest: digest_match[1], url: url }
end

fail!("formula target set is incomplete") unless current.keys.sort == TARGETS.keys.sort
current_versions = current.values.map { |entry| entry[:version] }.uniq
fail!("formula targets disagree on their current version") unless current_versions.length == 1

current_version = current_versions.fetch(0)
comparison = requested_version <=> parse_version(current_version)
fail!("refusing to downgrade #{current_version} to #{version}") if comparison.negative?

requested_digests = {
  "aarch64-apple-darwin" => macos_digest,
  "x86_64-unknown-linux-gnu" => linux_digest,
}

if comparison.zero?
  mismatches = current.filter_map do |target, entry|
    target if entry[:digest] != requested_digests.fetch(target)
  end
  fail!("release #{version} already exists with different checksums") unless mismatches.empty?

  puts "srcmv formula already matches #{version}"
  exit 0
end

updated = source.dup
current.each do |target, entry|
  new_url = "#{UPSTREAM}/v#{version}/srcmv-v#{version}-#{target}.tar.gz"
  old_pair = %(url "#{entry[:url]}"\n      sha256 "#{entry[:digest]}")
  new_pair = %(url "#{new_url}"\n      sha256 "#{requested_digests.fetch(target)}")
  fail!("could not locate the canonical #{target} URL/checksum pair") unless updated.scan(old_pair).length == 1

  updated.sub!(old_pair, new_pair)
end

fail!("formula update unexpectedly made no changes") if updated == source
File.binwrite(FORMULA, updated)
puts "Updated srcmv formula from #{current_version} to #{version}"
