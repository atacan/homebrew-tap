class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.0/codegenbox_0.6.0_darwin_arm64.tar.gz"
      sha256 "43cc59ea0187a3c535beeb5e35775f032120aef190b4ade1d3b299d4ee905ade"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.0/codegenbox_0.6.0_darwin_amd64.tar.gz"
      sha256 "f847cca4a72dc01550eff3b3ce9106186783d24384b682525857116afd1d7e42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.0/codegenbox_0.6.0_linux_arm64.tar.gz"
      sha256 "726d149894706d2e74f5503b8d8bce4c6a23f9b79a99f3c1efddf33bc85910be"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.0/codegenbox_0.6.0_linux_amd64.tar.gz"
      sha256 "467c6f597c756ba266d424d8c79014af1be6530b1fba1e7d441b5a68237912f4"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
