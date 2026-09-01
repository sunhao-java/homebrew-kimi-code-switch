cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "2.2.6"

  if Hardware::CPU.arm?
    sha256 "f14f302420bf0005340d0e55d8923d06f27d3372b03f0350d769913d5265df78"
  else
    sha256 "d8da9b22aff5036c9aea94d0eb7a32be42a52013b44f4e7816d6135c8e915b58"
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
