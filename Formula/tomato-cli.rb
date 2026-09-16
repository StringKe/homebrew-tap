class TomatoCli < Formula
  desc "番茄小说终端阅读器"
  homepage "https://github.com/StringKe/tomato-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.2/tomato-aarch64-apple-darwin.tar.gz"
      sha256 "5a78310b8ca8b3d19324315e5ada3f62d6b1cc41a78cde7a20df884606e248b2"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.2/tomato-x86_64-apple-darwin.tar.gz"
      sha256 "e9099abad89f64ae764723834839959e6d3d4da295eac03ca0ed25ce056cb5d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.2/tomato-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b39ba1c6bf1298ee48b63255e5023788e15957be90ca58f45c09ea0e1c9c2e85"
    end
    on_intel do
      url "https://github.com/StringKe/tomato-cli/releases/download/v0.1.2/tomato-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47bd098de5cc0f11a7d5b023f12ca4c3d564d0f4077b8cf9c89f0376c951eff0"
    end
  end

  def install
    bin.install "tomato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomato --version")
  end
end
