class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.2.0/translate-0.2.0-macos-arm64.tar.gz"
      sha256 "d7ff23742eca1238856ca57663f2b661724cfc7b8af747fa442f6c6405067177"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.2.0/translate-0.2.0-macos-amd64.tar.gz"
      sha256 "7b67388bf14641e752eb2ad5a0ccca944a04e314d24520b5fcd745e1dd51ee39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.2.0/translate-0.2.0-linux-arm64.tar.gz"
      sha256 "1963e81a2adc90b7c4bc05342f6d2deede8f446d3dd4029bcb560e43873f163f"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.2.0/translate-0.2.0-linux-amd64.tar.gz"
      sha256 "2c14e0699d9e8b3c876033885933d2b2d048b4900cc0e1f128c81b8640e29fdc"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
