class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.0/oapi-to-rust-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "aecde871218d8538025d670b14fc8ae7ae100cf2f72661e78bbcf9b175fe4afb"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.0/oapi-to-rust-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ae6f4d1695d1e9bddf1fa2a9089ee9b7cc28d19c444ccda04f2c7826c5f85976"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.0/oapi-to-rust-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3eb39427289b0c7956b0e4c4b670094e1722e301ad6c3bdfbacefaab1b5bba08"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.0/oapi-to-rust-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d410eb7a7fb6f12d735b9e8ddb16e4d13a702cfae76c6b49e9cc8704cf60e20"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
