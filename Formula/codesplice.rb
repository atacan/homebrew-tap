class Codesplice < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/code-splice"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/code-splice/releases/download/v0.2.0/codesplice-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e589b01623c1d0e1acb9f5a6adb301caaa2fe9fb5b1c04a32b90228fa870438a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/code-splice/releases/download/v0.2.0/codesplice-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc74815ee670f66ee3d183141c996427d586a6e67c95b7508dbac90e3cab4ab3"
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
