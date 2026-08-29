class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.1.0/oapi-to-rust-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "be0dbffed83ecc6bb5d81662c7037d1b948f89b9757287feb3050141753e83e3"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.1.0/oapi-to-rust-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d91c095c2a2c4ee415b49066a5e1a7d76662f2af1cc84cb3e256cc1fc07acc2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.1.0/oapi-to-rust-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18f9a9f8b858765e891d57ca81c621cf7257a31b4010a447da93a3ca8fc93633"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.1.0/oapi-to-rust-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3908a2ea1efab558a487b56c6b4aa7c2a06d01c6a1586b2049684b0aca78abb"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
