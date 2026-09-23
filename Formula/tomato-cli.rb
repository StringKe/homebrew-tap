class TomatoCli < Formula
  desc "番茄小说终端阅读器"
  homepage "https://github.com/StringKe/tomato-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.2.0/tomato-aarch64-apple-darwin.tar.gz"
      sha256 "91a3283b117fc7ec2b7897049f762ee012e9180c8cc8a74be06b90dbfa876786"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.2.0/tomato-x86_64-apple-darwin.tar.gz"
      sha256 "7420641652f8395b65a5b6f1490fbdc029467b2b80498eeb0f19ba4d54483259"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.2.0/tomato-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd6a9d05917e62c83c1eaa16534d5ed99cde971022b929d0f3699cb396d4f062"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.2.0/tomato-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc305eac4474165071504eefb9bae0027a33406a8902b9d80e06ebaabfabcead"
    end
  end

  def install
    bin.install "tomato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomato --version")
  end
end
