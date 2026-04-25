cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"

  if Hardware::CPU.arm?
    sha256 "767a795175ff1c75e951da0c47b460d478a48881696be09796a9cb8986317fb5"
  else
    sha256 "f32c6f31e560cb9a681695340f354a99295d8e04b05cd192bace20609ccdd0a6"
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
