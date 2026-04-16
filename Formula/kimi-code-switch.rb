class KimiCodeSwitch < Formula
  desc "Terminal UI for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-arm64.tar.gz"
      sha256 "84a68f050b5d6aeaeaf56d6fee325e23a895fd9906d80dc255e4f13072bfdd1e"
    else
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-amd64.tar.gz"
      sha256 "47e27c34763abd0e729cade2020270c5db62d54875248fcd76ba1280c497cf5d"
    end
  end

  livecheck do
    url :stable
    regex(/^v?(\d+\.\d+\.\d+)$/i)
  end

  def install
    bin.install "kimi-config-switch"
  end

  test do
    assert_match "Terminal UI for kimi-code-cli config.toml", shell_output("#{bin}/kimi-config-switch --help")
  end
end
