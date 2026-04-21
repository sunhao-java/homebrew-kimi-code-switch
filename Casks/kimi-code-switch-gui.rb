cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "1.0.2"

  if Hardware::CPU.arm?
    sha256 "9477279ec4ed59725ff47fb10b8c099a13567797a491828cedae5187102d6a45"
  else
    sha256 "03140639bf0641e363208665d90452c7281e79231b321bdac82b741708ab3807"
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
