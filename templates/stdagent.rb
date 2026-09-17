class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v@VERSION@/std-agent_@VERSION@_darwin_arm64.tar.gz"
      sha256 "@SHA_MAC_ARM@"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v@VERSION@/std-agent_@VERSION@_darwin_amd64.tar.gz"
      sha256 "@SHA_MAC_X64@"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v@VERSION@/std-agent_@VERSION@_linux_arm64.tar.gz"
      sha256 "@SHA_LINUX_ARM@"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v@VERSION@/std-agent_@VERSION@_linux_amd64.tar.gz"
      sha256 "@SHA_LINUX_X64@"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
