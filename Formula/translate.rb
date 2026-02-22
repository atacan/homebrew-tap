class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.3/translate-0.1.3-macos-arm64.tar.gz"
      sha256 "aecb80744066ad25f935e328bcea330df8c6e475e86f05f14554131a4388c2d1"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.3/translate-0.1.3-macos-amd64.tar.gz"
      sha256 "9b6befbf2c430fdafcf4edd7c5f976bfb0721ea390f94514539d2ffa23c2de30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.3/translate-0.1.3-linux-arm64.tar.gz"
      sha256 "671a2ca78314ea066eab6403e276db096dbb89b4a0693921e0cd7799567843c7"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.3/translate-0.1.3-linux-amd64.tar.gz"
      sha256 "23153d8e17e18689955522990f2e97eacfa6ecea7a918898b9a3e20a1a3a4547"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
