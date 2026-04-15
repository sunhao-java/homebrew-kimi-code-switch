# homebrew-kimi-code-switch

`kimi-code-switch` 的 Homebrew tap 仓库。

## 安装

由于仓库目前托管在 GitLab，请使用自定义 remote 方式 tap：

```bash
brew tap tools/kimi-code-switch ssh://git@gitlab.lodsve.com:9001/tools/homebrew-kimi-code-switch.git
brew install tools/kimi-code-switch/kimi-code-switch
```

安装完成后可直接运行：

```bash
kimi-config-panel
```

## 更新

```bash
brew update
brew upgrade tools/kimi-code-switch/kimi-code-switch
```

## 说明

- 本仓库遵循 Homebrew tap 标准结构，formula 位于 `Formula/` 目录。
- `Formula/kimi-code-switch.rb` 由主仓库的 GitHub Actions 在发布新 tag 后自动更新。
- 首个 GitHub tag 发布完成后，自动化流程会写入首版 formula。
