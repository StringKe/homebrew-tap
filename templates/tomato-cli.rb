class TomatoCli < Formula
  desc "番茄小说终端阅读器"
  homepage "https://github.com/StringKe/tomato-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v@VERSION@/tomato-aarch64-apple-darwin.tar.gz"
      sha256 "@SHA_MAC_ARM@"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v@VERSION@/tomato-x86_64-apple-darwin.tar.gz"
      sha256 "@SHA_MAC_X64@"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v@VERSION@/tomato-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "@SHA_LINUX_ARM@"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v@VERSION@/tomato-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "@SHA_LINUX_X64@"
    end
  end

  def install
    bin.install "tomato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomato --version")
  end
end
