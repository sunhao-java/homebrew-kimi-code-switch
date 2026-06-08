cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "2.1.0"

  if Hardware::CPU.arm?
    sha256 "d514ab40715cf0f7038dd60b800263668742c584399b652f3c2864f9ad81cb82"
  else
    sha256 "d929ea6b32e82f5c5f9453efc85dee7a793c8b63056f6f73eec726b6a11f05a5"
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

  caveats <<~EOS
    If you encounter the "App is damaged" error, please run the following command:
      sudo xattr -rd com.apple.quarantine "/Applications/Kimi Code Switch GUI.app"

    Or install with the --no-quarantine flag:
      brew install --cask --no-quarantine kimi-code-switch-gui
  EOS

  zap trash: [
    "~/Library/Application Support/Kimi Code Switch GUI",
    "~/Library/Logs/Kimi Code Switch GUI",
    "~/Library/Preferences/cn.crazycoder.kimi-code-switch-gui.plist",
    "~/Library/Saved Application State/cn.crazycoder.kimi-code-switch-gui.savedState",
  ]
end
