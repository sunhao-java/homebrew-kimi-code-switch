# homebrew-kimi-code-switch

`kimi-code-switch` 的 Homebrew Tap 仓库，用于通过 Homebrew 安装和更新 `kimi-code-switch` 命令行工具，以及 `Kimi Code Switch GUI` macOS 桌面版。

## 简介

`kimi-code-switch` 是一个终端交互工具，用于管理 `kimi-code-cli` 的 provider、model 和 profile 配置。

本仓库只维护 Homebrew Formula 和 Cask，不包含上游工具源码。实际安装内容来自上游仓库发布的 GitHub Release 产物。

## 安装

先添加 Tap：

```bash
brew tap sunhaojava/kimi-code-switch https://github.com/sunhao-java/homebrew-kimi-code-switch.git
```

再安装：

```bash
brew install kimi-code-switch
```

安装完成后，可通过以下命令启动：

```bash
kimi-code-switch
```

查看帮助：

```bash
kimi-code-switch --help
```

安装 macOS 桌面版：

```bash
brew install --cask kimi-code-switch-gui
```

安装完成后，可在应用程序中打开 `Kimi Code Switch GUI`。

## 更新

更新 Homebrew 索引并升级工具：

```bash
brew update
brew upgrade kimi-code-switch
brew upgrade --cask kimi-code-switch-gui
```

如果只想确认是否有新版本，可执行：

```bash
brew livecheck kimi-code-switch
```

## 卸载

卸载工具：

```bash
brew uninstall kimi-code-switch
brew uninstall --cask kimi-code-switch-gui
```

如不再需要该 Tap，可继续移除：

```bash
brew untap sunhaojava/kimi-code-switch
```

## 仓库结构

- `Formula/kimi-code-switch.rb`：Homebrew Formula，包含 CLI 版本、下载地址、校验和、安装逻辑与测试。
- `Casks/kimi-code-switch-gui.rb`：Homebrew Cask，包含 GUI 版本、下载地址和 macOS 应用安装规则。
- `README.md`：安装、更新和使用说明。
- `AGENTS.md`：仓库协作与自动化约束。

## 维护说明

- CLI 新版本发布时，主要更新 `Formula/kimi-code-switch.rb` 中的版本号、下载地址和 `sha256`。
- GUI 新版本发布时，主要更新 `Casks/kimi-code-switch-gui.rb` 中的版本号；下载地址对应 `kimi-code-switch-gui` 的 GitHub Release dmg 产物。
- Formula 安装的命令名当前为 `kimi-code-switch`。
- 发布前建议至少执行以下校验：

```bash
brew audit --strict --online Formula/kimi-code-switch.rb
brew audit --cask --strict kimi-code-switch-gui
brew test kimi-code-switch
```

## 上游项目

- CLI 上游仓库：<https://github.com/sunhao-java/kimi-code-switch>
- GUI 上游仓库：<https://github.com/sunhao-java/kimi-code-switch-gui>
