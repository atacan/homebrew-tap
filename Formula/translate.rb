class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.5.0/translate-0.5.0-macos-arm64.tar.gz"
      sha256 "b5cb0ede7f55e89d6c71ff0dbc7387183aa07a67b4fd61659dc5690380cefb44"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.5.0/translate-0.5.0-macos-amd64.tar.gz"
      sha256 "cb0a98bdd6be0bc35f0237e2964f86271572c8076c49f47f1f9c546518d0a874"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.5.0/translate-0.5.0-linux-arm64.tar.gz"
      sha256 "491b1133c79d2f1e9954d04660e1fbea51db505a9ecd7fd0f4c46e134f7ff8d8"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.5.0/translate-0.5.0-linux-amd64.tar.gz"
      sha256 "40ffdbd48080f13a967ff6aa3b2673499e47ced30972e22e658ae047d6a412d9"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
