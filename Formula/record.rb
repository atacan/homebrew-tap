class Record < Formula
  desc "Record audio, screen, or camera output from the terminal"
  homepage "https://github.com/atacan/record"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/record/releases/download/v0.1.0/record-0.1.0-macos-arm64.tar.gz"
      sha256 "3aa118175251110f37c1ae44a811c2b9dacebd10c5c386ac678e66334e70af16"
    end
    on_intel do
      url "https://github.com/atacan/record/releases/download/v0.1.0/record-0.1.0-macos-amd64.tar.gz"
      sha256 "48a45b0155622131f0ac20be3be362beb4f1155e219e097c9cd5da47e252e5ff"
    end
  end

  def install
    bin.install "record"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/record --version")
  end
end
