class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.1/codegenbox_0.6.1_darwin_arm64.tar.gz"
      sha256 "baab33f90cb0d9503bb6e9ec63c2780d57c96260a13276b9e84d64267fc52c07"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.1/codegenbox_0.6.1_darwin_amd64.tar.gz"
      sha256 "1a9adda6c4aad5ec27807b7258e43881b80fd36f8b9e6fdea76872d6afe5dc3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.1/codegenbox_0.6.1_linux_arm64.tar.gz"
      sha256 "fc67c8413ce8e639ef0b4400082fc12b83e0c7a8692b033d1c60db369cddeeff"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.6.1/codegenbox_0.6.1_linux_amd64.tar.gz"
      sha256 "aa0c2a92759137464487f556df23995d8c3acf99d482526f97c233725b02d69d"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
