class Srcmv < Formula
  desc "Byte-preserving code moves and copies for developers and coding agents"
  homepage "https://github.com/atacan/srcmv"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/atacan/srcmv/releases/download/v0.4.0/srcmv-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "bba72d745492cd4bb43a4088110546304c64805d55806d72a93d4d248d7fdfd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/atacan/srcmv/releases/download/v0.4.0/srcmv-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "149b421fe59e1720b20bda28d98bdbdc56af55ca96b9f2b39e408d3a15ef0f34"
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
