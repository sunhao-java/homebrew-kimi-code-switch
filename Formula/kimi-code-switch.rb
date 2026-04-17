class KimiCodeSwitch < Formula
  desc "Terminal UI for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch"
  version "1.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-arm64.tar.gz"
      sha256 "2b3954fff9ff5733e8d591e191010cb3cea4d2acd262398535efb108b75d7498"
    else
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-amd64.tar.gz"
      sha256 "95de5897dffe4c083cebe2c8399251dd090425f5fc0853e0af8eff9817a07594"
    end
  end

  livecheck do
    url :stable
    regex(/^v?(\d+\.\d+\.\d+)$/i)
  end

  def install
    bin.install "kimi-code-switch"
  end

  test do
    assert_match "Terminal UI for kimi-code-cli config.toml", shell_output("#{bin}/kimi-code-switch --help")
  end
end
