cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"

  if Hardware::CPU.arm?
    sha256 "99cf9268800878891f81e31a0952afed6c9c112f223c4e535412098fe87b9322"
  else
    sha256 "20d238d75da10daf8a211af768cb50a0ba0ee82f349db70116313bb9dca91213"
  end

  url "https://github.com/sunhao-java/kimi-code-switch-gui/releases/download/v#{version}/kimi-code-switch-gui-#{version}-mac-#{arch}.dmg"
  name "Kimi Code Switch GUI"
  desc "Desktop app for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch-gui"

  livecheck do
    url :url
    regex(/^v?(\d+\.\d+\.\d+)$/i)
  end

  app "Kimi Code Switch GUI.app"

  zap trash: [
    "~/Library/Application Support/Kimi Code Switch GUI",
    "~/Library/Logs/Kimi Code Switch GUI",
    "~/Library/Preferences/cn.crazycoder.kimi-code-switch-gui.plist",
    "~/Library/Saved Application State/cn.crazycoder.kimi-code-switch-gui.savedState",
  ]
end
