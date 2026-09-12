class OapiToRust < Formula
  desc "Deterministic OpenAPI 3.1 to Rust generator (models, client, server)"
  homepage "https://github.com/atacan/rust-openapi-generator"

  on_macos do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.2/oapi-to-rust-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "5bc10615e6a9e417e5fff0c4e6e16dc7a882d37027958eb1430f967591781d31"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.2/oapi-to-rust-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "2eb2e24794c648dd9bf061d1da42b475495cbd5da916bc5a3ca4e315d8234687"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.2/oapi-to-rust-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a14beb51b9b4d0ed44528b45b6ba4c05de6347878c065ab1ad1b97d8966dac0b"
    end

    on_intel do
      url "https://github.com/atacan/rust-openapi-generator/releases/download/v0.3.2/oapi-to-rust-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "901d9e4dd977805772f784feca0602c65407239f35e8aed1ab2998209f4d8056"
    end
  end

  def install
    bin.install "oapi-to-rust"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oapi-to-rust --version")
  end
end
