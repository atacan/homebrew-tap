class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.0/oapi-to-rust-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9d80c94f68cf5f7f1f55388a8c91337904666d56c6dadb62904d5229ff0988ea"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.0/oapi-to-rust-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "21fba71944b930318c70efa789a4dd7e91f7d6ae9470066f204bbd91dd12d95c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.0/oapi-to-rust-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14058ed874ff3e9e16489a77fc81c408d3673c322b70eaa6c44920a6481943bc"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.0/oapi-to-rust-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1b422a2a8746ab3068a795712070ef5efd90fb75af243eefc475db10e5b210e"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
