class Record < Formula
  desc "Record audio, screen, or camera output from the terminal"
  homepage "https://github.com/atacan/record"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/record/releases/download/v0.2.0/record-0.2.0-macos-arm64.tar.gz"
      sha256 "74bc377749d98e315972f40eb60162b1dfb6bacff29a5afa670e5a43750b4d4e"
    end
    on_intel do
      url "https://github.com/atacan/record/releases/download/v0.2.0/record-0.2.0-macos-amd64.tar.gz"
      sha256 "fdaff38529afcb8a9beda29b68322150ae8ff3bc44274c04cdb05ae94fcfdc59"
    end
  end

  def install
    bin.install "record"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/record --version")
  end
end
