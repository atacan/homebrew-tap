class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.1/oapi-to-rust-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "2f26ebae2fce2ce165f9c60d68df2cc5d5f33e1dee6de99caee35c18ecf1e7f9"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.1/oapi-to-rust-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "3a2abd98426f7a89320cd532412c3434c3a371c557f45ebe1151edfbd3baa589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.1/oapi-to-rust-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fc33856793046054bea1c822b139b230434df5b0fec41e8a860674b6f606c6b"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.2.1/oapi-to-rust-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8fda467a6d2f8f90aa54d037538ad58bb620e6ec32ead1cb5d683007d058fa26"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
