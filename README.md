# macOS dotfiles

---

Welcome to my macOS configuration files

## Default:

- Editor -> [Neovim](https://neovim.io/)
- Terminal -> [WezTerm](https://wezfurlong.org/wezterm/index.html)
- Shell -> [Fish](https://fishshell.com/)

## Homebrew packages

- [Browsh](https://www.brow.sh/docs/installation/)
- [Ytop](https://github.com/cjbassi/ytop?tab=readme-ov-file#homebrew)
- [Yazi](https://yazi-rs.github.io/docs/installation/#homebrew)
- [Tmux](https://formulae.brew.sh/formula/tmux)

## Symbolic Links

1. For tmux, execute in `$HOME`

```sh
ln -s -f .config/.tmux.conf
```

2. For WezTerm, execute in `$HOME`

```sh
ln -s -f .config/.wezterm.lua
```
