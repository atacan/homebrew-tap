class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.4.0/oapi-to-rust-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "58c521c0f1c23b49a938587b5ec49214984622906d0814510dd8d3ee8ba64d9f"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.4.0/oapi-to-rust-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9bf1755c996ac7d59fa2c9b6375dab6ce0519ff8dac4ab102a0b00508430a556"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.4.0/oapi-to-rust-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62481085c4dd12181a7df85d08fc70f59650f03c6a8b01b42f190f4b016c6088"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.4.0/oapi-to-rust-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7669edeecc6b881114c84c1c540b0176ac5e19f88eda4af44a45705bb4aef1c5"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
