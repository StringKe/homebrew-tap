class TomatoCli < Formula
  desc "番茄小说终端阅读器"
  homepage "https://github.com/StringKe/tomato-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.0/tomato-aarch64-apple-darwin.tar.gz"
      sha256 "80fb08d757ba4c855d4635b9ce4523efddae3e68110c435e869afc2c6928e13e"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.0/tomato-x86_64-apple-darwin.tar.gz"
      sha256 "fb3be5e1bc2a23475d93bb5ac5a84581300aedefbfd88e53bd3828fe650ab80a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.0/tomato-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27b128f2c169ce6fc7337dcbfc72b94d7357d8dea7adc979e98f1de16fa0505f"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.0/tomato-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4c21ccb67be12b60dd8c26f227fec09c6aaddde08214cf5d12515da26fc4040"
    end
  end

  def install
    bin.install "tomato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomato --version")
  end
end
