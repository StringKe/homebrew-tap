class Stdagent < Formula
  desc "Single .stdai/ source of truth, synced to native AI CLI configs"
  homepage "https://github.com/StringKe/std-agent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.21/std-agent_0.0.21_darwin_arm64.tar.gz"
      sha256 "af51f68cf50be5e35ebfc8ff4ac277b63f2630f0b98f933e35c5c9a7e82f2772"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.21/std-agent_0.0.21_darwin_amd64.tar.gz"
      sha256 "1a103ea82b1b4aed09b98442bbdcb9581b300359e408ad677dcf069586e8f8a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.21/std-agent_0.0.21_linux_arm64.tar.gz"
      sha256 "ed018ed5a3e1c76a5cb28851c28937946f8227e0f8b985f2088588d41db0a8af"
    end
    on_intel do
      url "https://github.com/StringKe/std-agent/releases/download/v0.0.21/std-agent_0.0.21_linux_amd64.tar.gz"
      sha256 "0e340ba6fb1b6ad12b4d183251f0b1f1982a2db165ebcf2506022d163fc1d824"
    end
  end

  def install
    bin.install "stdagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stdagent version")
  end
end
