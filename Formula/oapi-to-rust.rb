class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.1/oapi-to-rust-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "467adf44f18446d9a78b25ae4e47ad4f0ae2d3230e62e46efff5efaade652227"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.1/oapi-to-rust-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "f43ce6b185ac079c5c2ea32d43c02b745dfbf6aa227f530d88c919c81f3f6a5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.1/oapi-to-rust-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93b6f4cf747371574d01678e1b11dbf174d80472e36e2ce7bd82d85fc4540b9b"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.1/oapi-to-rust-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ada37c5a143999722e4db279f5f49f1685c0ddf143d0a041d9dd61c6e9564fb"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
