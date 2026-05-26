# homebrew-tap

Homebrew tap for okakoh tools.

## Formulae

### tmux-manager

Install:

```sh
brew install okakoh/tap/tmux-manager
```

Upgrade:

```sh
brew upgrade tmux-manager
```

`tmux-manager` uses the `tmux` executable already available in your shell. This tap intentionally does not install or upgrade Homebrew's `tmux` formula, so existing tmux servers are not disturbed during installation.

If you need a specific tmux client, set `tmux_binary` in `~/.config/tmux-manager/config.yaml`.

Source: https://github.com/okakoh/tmux-manager
