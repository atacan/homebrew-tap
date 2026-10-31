class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.1/codegenbox_0.7.1_darwin_arm64.tar.gz"
      sha256 "71a80f9ebe6a5bb2dabc0e6c1e33cf89eb2d75ca23a8856f0b9405599cc9791e"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.1/codegenbox_0.7.1_darwin_amd64.tar.gz"
      sha256 "cc3695cd9717ac483c4506ccebca9c78bcd441b753ceac387fdec90b1efb96a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.1/codegenbox_0.7.1_linux_arm64.tar.gz"
      sha256 "a310efc70dd139b60729d2fe892e9486c07f38cdc8a1a5dd84e1a2421bbba3f5"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.1/codegenbox_0.7.1_linux_amd64.tar.gz"
      sha256 "357c56794de4247219f7c21c0d51af6f7f290cc50297c20e93afee898ed0b002"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
