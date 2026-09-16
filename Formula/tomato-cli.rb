class TomatoCli < Formula
  desc "番茄小说终端阅读器"
  homepage "https://github.com/StringKe/tomato-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.1/tomato-aarch64-apple-darwin.tar.gz"
      sha256 "f1bacd87712a6ac7b282b66da50808ce276a7c8dc143dff11a696974501240a6"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.1/tomato-x86_64-apple-darwin.tar.gz"
      sha256 "4c6a7b1edb337df556306d677e0ae0f6f18685e1e6fde52d248010696d00caf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.1/tomato-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8543d25b382bf9a21b07efd0d55ed893cb15ada8e9e1ec582abcbfd48809e262"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.1/tomato-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e245d61b2f6e59bb5625459dc465ee2a0ebd9aec68b8619ba11d5b03a87f52df"
    end
  end

  def install
    bin.install "tomato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomato --version")
  end
end
