class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.1/codegenbox_0.2.1_darwin_arm64.tar.gz"
      sha256 "5ee5728821c8332c1f7d0773c17c2e7ecd432e7878a0a67733c4d8111953f3ae"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.1/codegenbox_0.2.1_darwin_amd64.tar.gz"
      sha256 "aaffe9ce557eac2c0bf52ce0788853a9c10a254195e7540e260b53d9e93f6a75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.1/codegenbox_0.2.1_linux_arm64.tar.gz"
      sha256 "4ac69055dac1abad21632f409424a83f72a978f3a42323b92890888e8bfea502"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.1/codegenbox_0.2.1_linux_amd64.tar.gz"
      sha256 "51a40aa899cfde5f870dba4a6fdfd0047545f76b50407a4950c339edf1fb6e0b"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
