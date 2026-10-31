class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.2/codegenbox_0.7.2_darwin_arm64.tar.gz"
      sha256 "15f979667e764444b47b5fec41c48c7f00d5ec4b9595f1501eb465cca86f67d0"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.2/codegenbox_0.7.2_darwin_amd64.tar.gz"
      sha256 "a374610d8e0fc921b2a6bccc3327cfc96c4a9359861361f36059ccc316761652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.2/codegenbox_0.7.2_linux_arm64.tar.gz"
      sha256 "126b50f47451632566b8a7c4c3c00d16dd8081859287700c31fa5f0894e0955a"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.2/codegenbox_0.7.2_linux_amd64.tar.gz"
      sha256 "957e10e864b5708f6e748e040728e298f5e31c010e6d6d7db481bbfa9b54d4c6"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
