class Translate < Formula
  desc "Translate text and files with configurable providers and prompt presets"
  homepage "https://github.com/atacan/translate"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.2/translate-0.1.2-macos-arm64.tar.gz"
      sha256 "319ff4e9389dc881034ecd22e510778df5cc0c06885b8331b83b9964f3094e61"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.2/translate-0.1.2-macos-amd64.tar.gz"
      sha256 "d4e41141adce3378f96ba6d18ab00a7fc74d26e5bc758e2b69d1f137bd9ede8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atacan/translate/releases/download/v0.1.2/translate-0.1.2-linux-arm64.tar.gz"
      sha256 "aa0c948418943dd7105ccd2b1eb66191a4adb6af9cfcfc9201949cf1869cb2bf"
    end
    on_intel do
      url "https://github.com/atacan/translate/releases/download/v0.1.2/translate-0.1.2-linux-amd64.tar.gz"
      sha256 "5520d27dfc3f06ce28e7ea75edad73d4818ec2bba5bb8acffbee4b4a1a13f85a"
    end
  end

  def install
    bin.install "translate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/translate --version")
  end
end
