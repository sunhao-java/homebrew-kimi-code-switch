class KimiCodeSwitch < Formula
  desc "Terminal UI for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch"
  version "1.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-arm64.tar.gz"
      sha256 "9c44f75347d79eaa9f0213201ef68a7e5e55b11c552cf46f2c9f66a0eb244f9d"
    else
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-amd64.tar.gz"
      sha256 "b8f8cb8af84fc004bbd0f09dd6f312fed635812de317745fd8fece6fadddecee"
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
