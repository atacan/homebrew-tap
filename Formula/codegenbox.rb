class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.5.0/codegenbox_0.5.0_darwin_arm64.tar.gz"
      sha256 "417669ab66a9983885b6074dab95f0661cb0da4af026d65224b38d02893bacee"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.5.0/codegenbox_0.5.0_darwin_amd64.tar.gz"
      sha256 "e9f3e988f8e8f12a42deb26565231b66a60ed1e5149367ac9863920dc33ba4de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.5.0/codegenbox_0.5.0_linux_arm64.tar.gz"
      sha256 "0061e31a29ea7ee6bc7aaf070863833db6c607f2c1035f173633186c9d8a65ca"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.5.0/codegenbox_0.5.0_linux_amd64.tar.gz"
      sha256 "5e12d4977c838d0356b7183e8eb7d97905db2a856ab8e4e0009ac31dc3ff0b74"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
