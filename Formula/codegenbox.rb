class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.4.0/codegenbox_0.4.0_darwin_arm64.tar.gz"
      sha256 "aba7fea52cf93d8b02320b128777f18496385cd2237e49d3d5249c1d4804a964"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.4.0/codegenbox_0.4.0_darwin_amd64.tar.gz"
      sha256 "820e642ee0ef3c272597351fc99c45e71d51259ef5c1ae1ea649a8edb972c5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.4.0/codegenbox_0.4.0_linux_arm64.tar.gz"
      sha256 "a3be9520eface5587774ffee7288a892123386d9b7c26f143166992367a55ead"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.4.0/codegenbox_0.4.0_linux_amd64.tar.gz"
      sha256 "2f72701483ceb7d4d7e94b49de1881e55c00a421aba61b95577edcb7c34de063"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
