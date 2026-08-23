class Srcmv < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/srcmv"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/srcmv/releases/download/v0.5.0/srcmv-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d353984e5fd157c2b9d8e893697651a10b848751420d1ab658ef33279339b48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/srcmv/releases/download/v0.5.0/srcmv-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ce36a92220440ddf434f48b3474a58c6d16f755ab4e87faa05d493ce2a4af88"
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
