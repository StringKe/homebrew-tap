class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.18/std-agent_0.0.18_darwin_arm64.tar.gz"
      sha256 "cda083a04fe6a7b4361526d55ba9081230e50c74ac10f1623d9dfddaccfd576a"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.18/std-agent_0.0.18_darwin_amd64.tar.gz"
      sha256 "49d864e1f3d4282b5c0a68cfa7eed78585604d9157548b526540ea8b19e281fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.18/std-agent_0.0.18_linux_arm64.tar.gz"
      sha256 "65a482a9b0fe01cdcb25462570d140e613506a45c706d53999c17ab46defaae8"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.18/std-agent_0.0.18_linux_amd64.tar.gz"
      sha256 "2a5e782eb249757d9b8a51aea50c7ec67dc958cb4feacdbe877646270c4f4252"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
