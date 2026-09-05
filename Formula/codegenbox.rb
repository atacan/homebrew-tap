class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.1.0/codegenbox_0.1.0_darwin_arm64.tar.gz"
      sha256 "31db84db7303cd62ada7bd4586e20b0d09580333a7c07458ddcf350888747c12"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.1.0/codegenbox_0.1.0_darwin_amd64.tar.gz"
      sha256 "73c1c0fa0449fdd63ad688c96aa9931afc30e9bdd91d23f22543a4382e433581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.1.0/codegenbox_0.1.0_linux_arm64.tar.gz"
      sha256 "099223e203c8ae01fe60fa07b8e3433772d2c4ebe7f07f7f171118b9943d607d"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.1.0/codegenbox_0.1.0_linux_amd64.tar.gz"
      sha256 "4935362b2202bb05e1462c63a452e28989ada25e3a4be647e4d55000b86528e5"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
