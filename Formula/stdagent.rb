class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.20/std-agent_0.0.20_darwin_arm64.tar.gz"
      sha256 "3c858fe2fa04ccf9e8b5057a1137b79d18463e67d52c6671387e48df7cc85955"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.20/std-agent_0.0.20_darwin_amd64.tar.gz"
      sha256 "d2420f16cb77f594cf63641972c048d4f4e4007727aed179f2dc6562e6dd17d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.20/std-agent_0.0.20_linux_arm64.tar.gz"
      sha256 "23b35c618cb6486209b1c6fe18eb7dbe33346dd4b1cd1f92045d82ab61096831"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.20/std-agent_0.0.20_linux_amd64.tar.gz"
      sha256 "ada35428abb7d046f00b1cb3b4a03fffc6fffb507d6a11054752f805d615226d"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
