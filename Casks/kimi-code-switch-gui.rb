cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 :no_check

  url "https://github.com/sunhao-java/kimi-code-switch-gui/releases/download/v#{version}/kimi-code-switch-gui-#{version}-mac-#{arch}.dmg"
  name "Kimi Code Switch GUI"
  desc "Desktop app for managing kimi-code-cli providers, models, and profiles"
  homepage "https://github.com/sunhao-java/kimi-code-switch-gui"

  app "Kimi Code Switch GUI.app"

  zap trash: [
    "~/Library/Application Support/Kimi Code Switch GUI",
    "~/Library/Logs/Kimi Code Switch GUI",
    "~/Library/Preferences/cn.crazycoder.kimi-code-switch-gui.plist",
    "~/Library/Saved Application State/cn.crazycoder.kimi-code-switch-gui.savedState",
  ]
end
