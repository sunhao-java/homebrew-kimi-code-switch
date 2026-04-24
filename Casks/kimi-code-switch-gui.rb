cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "1.0.4"

  if Hardware::CPU.arm?
    sha256 "5f19653034e8ce3eee2c60a017ddfcb5975e9bf92287ce60293391e8c32745d8"
  else
    sha256 "d2e205293a68b8c9cdd001790f70a8dc9fa8dcf3033dbcfd264a66df43ac6ef6"
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
