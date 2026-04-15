class KimiCodeSwitch < Formula
  desc "Terminal UI for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-arm64.tar.gz"
      sha256 "c7f927a67ef01c0a563fbc1b515a75e32ede2a451c8d9d9663963dad5bd9b527"
    else
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-amd64.tar.gz"
      sha256 "d893680ebf90adec342cbdb429918afca2499890b7e6d998733b469b7336a971"
    end
  end

  livecheck do
    url :stable
    regex(/^v?(\d+\.\d+\.\d+)$/i)
  end

  def install
    bin.install "kimi-config-panel"
  end

  test do
    assert_match "Terminal UI for kimi-code-cli config.toml", shell_output("#{bin}/kimi-config-panel --help")
  end
end
