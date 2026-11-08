class Srcmv < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/srcmv"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/srcmv/releases/download/v0.7.0/srcmv-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "6c6075c2acc4f5de87863e591456bc4dccef5fc7956ce2e46632f02008916356"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/srcmv/releases/download/v0.7.0/srcmv-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "912351c73082232ca85777c0f32924f587c08dfb34faf9409c4787e48bc3a790"
    end
  end

  def install
    bin.install "srcmv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srcmv --version")

    capabilities = shell_output("#{bin}/srcmv capabilities --json")
    assert_match '"protocol_version":1', capabilities
    assert_match '"commit":true', capabilities

    protocol = shell_output("#{bin}/srcmv protocol-version --json")
    assert_match '"protocol_version":1', protocol
  end
end
