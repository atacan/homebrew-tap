class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.3/codegenbox_0.6.3_darwin_arm64.tar.gz"
      sha256 "123641d99a88fa16222c06c2ab414a98528723b7825b38afa5cfa1a58774c690"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.3/codegenbox_0.6.3_darwin_amd64.tar.gz"
      sha256 "daafadf2537f942a486883c692377c9fad0f717dabde108e62a73a63ef16d96b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.3/codegenbox_0.6.3_linux_arm64.tar.gz"
      sha256 "a35238a6b8df08792a05d3c25b9f47a43744fd59287cf76522e1948f8c6d36ba"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.3/codegenbox_0.6.3_linux_amd64.tar.gz"
      sha256 "910c9cbb199e52a1db76fee7e2b1f62ba21eb7d86745fad6061a968cbc356d10"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
