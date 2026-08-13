class Codesplice < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/code-splice"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/code-splice/releases/download/v0.1.1/codesplice-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "40acb830511ec4d7cdfb0e49bab4de3b4fb193f84188a0e5c6d60e103ae2ef4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/code-splice/releases/download/v0.1.1/codesplice-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a83819bac3397286caa2ee11f9ed87232c809e9a918f93490a1f0824d0f55524"
    end
  end

  def install
    bin.install "codesplice"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesplice --version")

    capabilities = shell_output("#{bin}/codesplice capabilities --json")
    assert_match '"protocol_version":1', capabilities
    assert_match '"commit":true', capabilities

    protocol = shell_output("#{bin}/codesplice protocol-version --json")
    assert_match '"protocol_version":1', protocol
  end
end
