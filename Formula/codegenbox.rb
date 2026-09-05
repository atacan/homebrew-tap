class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.2/codegenbox_0.2.2_darwin_arm64.tar.gz"
      sha256 "7a3704206d1ee951260eeb331236f18a241b5e97ba12949e0a2c3810d5499240"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.2/codegenbox_0.2.2_darwin_amd64.tar.gz"
      sha256 "e32651bb347ce2b3c35606f7a4d6b4f5f134dbe50184ebd9c0fac39b399c1f95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.2/codegenbox_0.2.2_linux_arm64.tar.gz"
      sha256 "27e8ba019d2c576b00f5d14f4a140384e313a5836e9fd3116974fd646dba7c7c"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.2.2/codegenbox_0.2.2_linux_amd64.tar.gz"
      sha256 "c9da8da48e0ccbd942d1c79e40a41300629f7a8fb0a5241179c29c6083780b77"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
