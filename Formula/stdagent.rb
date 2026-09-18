class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.19/std-agent_0.0.19_darwin_arm64.tar.gz"
      sha256 "610bc582f6ee115b3bce126a269090337d88f66e4c08608b8705437e5fbeff66"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.19/std-agent_0.0.19_darwin_amd64.tar.gz"
      sha256 "65d4128617eb62007ef9d31690ed14184adcd337b5427b2d11de482a2631ebd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.19/std-agent_0.0.19_linux_arm64.tar.gz"
      sha256 "d70c00cb4252fe31b8c58f0bcbf839272f5da994c3aabad8b7ef6d85454974ac"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.19/std-agent_0.0.19_linux_amd64.tar.gz"
      sha256 "bbb185f6b8f8103762a3a0dbcf5e784ba20b69baa1b6b5bc7912566e081c9ae3"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
