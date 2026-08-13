class Codesplice < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/code-splice"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/code-splice/releases/download/v0.2.1/codesplice-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "e683112c80e686fa8d3cd82123c8727aed7158d853015d3f7b1df45f5fe3cab8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/code-splice/releases/download/v0.2.1/codesplice-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9e996caf9fa55fab72b832bf1d03c9b09b81b2c16a2ba74f69aca085c56677e"
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
