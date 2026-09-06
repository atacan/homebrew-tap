class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.3.0/codegenbox_0.3.0_darwin_arm64.tar.gz"
      sha256 "513b074d8290db678ceb2cb66a420934d5f0792e130fe26a78164ca4d7667455"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.3.0/codegenbox_0.3.0_darwin_amd64.tar.gz"
      sha256 "62267665b4ee78cec061b2606af96353bb7ea7323e188e6d32997337146c8c9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.3.0/codegenbox_0.3.0_linux_arm64.tar.gz"
      sha256 "5a049436d647a4703eee9899a4e249ad97272e4f09df79d66f9f32ed672afb96"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.3.0/codegenbox_0.3.0_linux_amd64.tar.gz"
      sha256 "defcb7fa77411fc899c383d00f831da687c7b191fb7be45b74805b5159b0654a"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
