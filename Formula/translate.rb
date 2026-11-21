class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.5.1/translate-0.5.1-macos-arm64.tar.gz"
      sha256 "e13ba7643bc0e08d3833607f777c4dd017c6195f4143496f5c9082d04d004c56"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.5.1/translate-0.5.1-macos-amd64.tar.gz"
      sha256 "ab3b7cc7622319e0ee9dd268f464f8bfeee0d597e69db6d99d1570449612489d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.5.1/translate-0.5.1-linux-arm64.tar.gz"
      sha256 "6a8f5be009e7e672bd8ffc0702ff353f543d81f579a12c0968d267f6eb18d22a"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.5.1/translate-0.5.1-linux-amd64.tar.gz"
      sha256 "35e731523cd131fa9426779b1003dcb1e0f0cceca5339c48723d6fda184d0bbf"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
