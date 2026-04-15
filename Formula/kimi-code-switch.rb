class KimiCodeSwitch < Formula
  desc "Terminal UI for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-arm64.tar.gz"
      sha256 "2b7061ca5b6f8537d8d4d050c9a81c0975a798cbc5633466a2ecb1900bbb5807"
    else
      url "https://github.com/sunhao-java/kimi-code-switch/releases/download/v#{version}/kimi-code-switch-v#{version}-macos-amd64.tar.gz"
      sha256 "90a10e601c0725b240d11205a9fc04688d741ef3b44cc056cc70a46a3800a302"
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
