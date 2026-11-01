class Codegenbox < Formula
  desc "Run coding agents safely in disposable Docker containers"
  homepage "https://github.com/atacan/codegenbox"

  on_macos do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.3/codegenbox_0.7.3_darwin_arm64.tar.gz"
      sha256 "b8cdc7189fb050283d6251bf917ed2d624515fa723a0c4ee40a08d3b91add16c"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.3/codegenbox_0.7.3_darwin_amd64.tar.gz"
      sha256 "660c556bcce49228c0538651cfdbcd11eb73ccad2d3dfb6eea9e1579ef8ce9d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.3/codegenbox_0.7.3_linux_arm64.tar.gz"
      sha256 "5160b5e49432329c717736207dfffc0a73546dfd2a3c924b37ddbbf33f98a455"
    end

    on_intel do
      url "https://github.com/atacan/codegenbox/releases/download/v0.7.3/codegenbox_0.7.3_linux_amd64.tar.gz"
      sha256 "1e3b7c5070e5a4b089cabaab6ed8798153e193166032d904fa1adbd17471eb85"
    end
  end

  def install
    bin.install "codegenbox"
  end

  test do
    assert_match "codegenbox #{version}", shell_output("#{bin}/codegenbox --version")
  end
end
