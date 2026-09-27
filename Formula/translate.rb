class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.3.0/translate-0.3.0-macos-arm64.tar.gz"
      sha256 "be7e6cc4e1d70bdd82cfe23cc5c9608a308a132c9476edc73f13084818c4df38"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.3.0/translate-0.3.0-macos-amd64.tar.gz"
      sha256 "3ea814826440ee91ccbbcd2e6cdb912a4d50d385656b4184096dc3bc1108a7b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.3.0/translate-0.3.0-linux-arm64.tar.gz"
      sha256 "f05f33cf865fac5d5cd379d1cdf15e7a6d66747aa1e7cf3c6961c3d21a20cb0a"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.3.0/translate-0.3.0-linux-amd64.tar.gz"
      sha256 "e0e6e21208bfb5d8abc53dd7e8f1b4d697fe59e3043f5ce9ab9444ce7b886d1e"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
