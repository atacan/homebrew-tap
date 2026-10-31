class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.0/codegenbox_0.7.0_darwin_arm64.tar.gz"
      sha256 "503d18bae324d8b94eb1edec36e456b4af1e09856e064cc941f8677a4cdea3c2"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.0/codegenbox_0.7.0_darwin_amd64.tar.gz"
      sha256 "39dab9a9bdc9950a9139dc3033c4a53efd66a37c6c56397bf5b0866f8d41b84c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.0/codegenbox_0.7.0_linux_arm64.tar.gz"
      sha256 "e8398060719becdb558ef7b6992ba803765df6f72dad50d8aebbbfadc286d1ce"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.0/codegenbox_0.7.0_linux_amd64.tar.gz"
      sha256 "bb3dd33bcd0979b6d15ffe2198acd0021c331f46e4392f9767ed784febf81513"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
