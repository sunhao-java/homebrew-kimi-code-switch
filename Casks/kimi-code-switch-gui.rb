cask "kimi-code-switch-gui" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"

  if Hardware::CPU.arm?
    sha256 "b3bd2c869127ec6337512d630659a1ee02e33fc29224bb6a5b72043ef519c06b"
  else
    sha256 "19f49fb1bd9bab6b83006e4c15f97458f7a3402f1b21847f1322525956b0ad8c"
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
