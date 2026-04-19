# Repository Guidelines

## Project Structure & Module Organization

This repository is a Homebrew tap for `kimi-code-switch` and `Kimi Code Switch GUI`. Keep the tap layout simple:

- `Formula/kimi-code-switch.rb` contains the Homebrew formula, release URLs, checksums, install rule, livecheck rule, and formula test.
- `Casks/kimi-code-switch-gui.rb` contains the Homebrew cask for the macOS desktop app.
- `README.md` documents user-facing tap, install, update, and run commands.
- `AGENTS.md` documents contributor and automation expectations for this repository.

Do not add source code for upstream projects here. Runtime artifacts should come from GitHub releases produced by the upstream `kimi-code-switch` and `kimi-code-switch-gui` repositories.

## Build, Test, and Development Commands

Use Homebrew commands from this repository root:

- `brew audit --strict --online Formula/kimi-code-switch.rb` checks Homebrew style and metadata.
- `brew audit --cask --strict kimi-code-switch-gui` checks GUI cask style and metadata after the tap is registered.
- `brew test kimi-code-switch` runs the formula `test do` block after installation.
- `brew install --build-from-source Formula/kimi-code-switch.rb` validates local installation behavior.
- `brew install --cask kimi-code-switch-gui` validates GUI cask installation behavior after the tap is registered.
- `brew livecheck Formula/kimi-code-switch.rb` verifies the formula can discover upstream tags.

For user verification, install through the tap:

```bash
brew tap sunhaojava/kimi-code-switch git@github.com:sunhao-java/homebrew-kimi-code-switch.git
brew install kimi-code-switch
brew install --cask kimi-code-switch-gui
kimi-config-switch --help
```

## Coding Style & Naming Conventions

Formula and cask code is Ruby and should follow Homebrew conventions. Use two-space indentation, keep the class name `KimiCodeSwitch`, and keep formula fields in the conventional order: `desc`, `homepage`, `version`, platform-specific `url` and `sha256`, `livecheck`, `install`, then `test`.

When updating CLI releases, change only the version, URLs if the artifact naming changed, and the corresponding SHA-256 values. Keep the installed command name as `kimi-config-switch` unless the upstream artifact changes. When updating GUI releases, change the cask version and URLs only if the GitHub release artifact naming changed.

## Testing Guidelines

The formula test should exercise a stable, non-interactive command. Current behavior checks:

```ruby
assert_match "Terminal UI for kimi-code-cli config.toml", shell_output("#{bin}/kimi-config-switch --help")
```

If upstream help text changes, update the assertion to match a durable phrase. Run `brew audit` and `brew test` before submitting formula changes.

## Commit & Pull Request Guidelines

Recent history uses short imperative or `chore:`-prefixed commits, for example `chore: 更新 kimi-code-switch 1.0.0`. Keep commits focused on one release or documentation update.

Pull requests should include the target version, artifact URLs, SHA-256 checksums, and validation results from `brew audit` and `brew test`. Link the upstream release when updating the formula.

## Agent-Specific Instructions

Treat this tap as generated release metadata. Avoid unrelated refactors, do not overwrite uncommitted work, and stage only files changed for the current task, for example `git add AGENTS.md`.
