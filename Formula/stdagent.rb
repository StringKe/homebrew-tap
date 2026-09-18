class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.22/std-agent_0.0.22_darwin_arm64.tar.gz"
      sha256 "7c0638f55ae829aa2d7063f0693959dc1f7cdc48689888d14ed9bfb282b1bb75"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.22/std-agent_0.0.22_darwin_amd64.tar.gz"
      sha256 "6743962e14b0a1fa2784aa1f05fab27b98506f3d2cdeb7f0f1ca93257584f9fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.22/std-agent_0.0.22_linux_arm64.tar.gz"
      sha256 "82921ab8cf5668b42d87c0484f10bb9e308a1bdbd059684433fb2b727e4465d0"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.22/std-agent_0.0.22_linux_amd64.tar.gz"
      sha256 "1856dccd0031c0951c66df79603404175da8b95cf011c13af907efb4b9eb6f76"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
