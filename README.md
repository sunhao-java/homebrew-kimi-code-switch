# homebrew-kimi-code-switch

`kimi-code-switch` 的 Homebrew tap 仓库。

## 安装

仓库当前托管在 GitHub，请使用自定义 remote 方式 tap：

```bash
brew tap tools/kimi-code-switch git@github.com:sunhao-java/homebrew-kimi-code-switch.git
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
