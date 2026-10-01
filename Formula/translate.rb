class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.4.0/translate-0.4.0-macos-arm64.tar.gz"
      sha256 "28c0c11e3dd259d4ae6679c8f97ffa0b52266793685c119e531439c662fe05e9"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.4.0/translate-0.4.0-macos-amd64.tar.gz"
      sha256 "b64619c66184d0f087aa84c7830ad57ae60a333bc6b30ee73db9bb2d2fa37493"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.4.0/translate-0.4.0-linux-arm64.tar.gz"
      sha256 "ee691cd6e542dee16ce0a3374c9edfd7c8dd0688b240f446b2c88883a3c7b47a"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.4.0/translate-0.4.0-linux-amd64.tar.gz"
      sha256 "52bd0295741704166dd698e9acdde206036cffefc1e324ec5802303dee729e21"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
