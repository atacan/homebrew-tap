class Codesplice < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/code-splice"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/code-splice/releases/download/v0.3.0/codesplice-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f094d1cff79a984251bfbd92d65acf3fcb51553909c3d34160af63dd38c1d968"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/code-splice/releases/download/v0.3.0/codesplice-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "040b5de0a272590c25892e41e2fcead59bdc2c49b58713c36c9353e1ff6508e6"
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
