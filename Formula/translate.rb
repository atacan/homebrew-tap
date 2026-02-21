class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.0/translate-0.1.0-macos-arm64.tar.gz"
      sha256 "2627c8a65f8e24aa769b9857f00c97c727d79306932a41dee1d6a5c7dcfd1e0c"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.0/translate-0.1.0-macos-amd64.tar.gz"
      sha256 "00f860507b20716b0ca886f0777437783527baa5292ae54165488159f476d52c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.0/translate-0.1.0-linux-arm64.tar.gz"
      sha256 "2d0bf9f0be7056c92a11dc82de531dc98b522d3e5a1033c63a376246a00f9f42"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.0/translate-0.1.0-linux-amd64.tar.gz"
      sha256 "0b45f16555c6342804f4f631a7a5a37f17167eb2564bca024c4a0a3eada8c007"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
