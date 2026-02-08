class Record < Formula
  desc "Record audio, screen, or camera output from the terminal"
  homepage "https://github.com/atacan/record"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/record/releases/download/v0.2.1/record-0.2.1-macos-arm64.tar.gz"
      sha256 "83ef7445bba7732c4a148182c2e9e9723191a6c2b1d31916b29ef6fdd6ae2ab3"
    end
    on_intel do
      url "https://github.com/atacan/record/releases/download/v0.2.1/record-0.2.1-macos-amd64.tar.gz"
      sha256 "28943f809c3d7d65d3bbaa939bd282ba1e43f1790388a0abd9a70e22094dc5ed"
    end
  end

  def install
    bin.install "record"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/record --version")
  end
end
