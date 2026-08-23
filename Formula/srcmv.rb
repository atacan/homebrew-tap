class Srcmv < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/srcmv"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/srcmv/releases/download/v0.6.1/srcmv-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "9b6d07d05d738b1d189d6449a24b2642732d40734f32bb1770e3b38ebb861cdf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/srcmv/releases/download/v0.6.1/srcmv-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8e332ff7b858b20eebadb573a8b466d2f3889e8380b5e521b99e17f1c78ca2c"
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
