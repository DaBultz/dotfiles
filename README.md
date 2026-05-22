# Dotfiles

## Install commands:

### Neovim:

```sh
sudo pacman -S base base-devel tree-sitter-cli ripgrep grim slurp
```

### Tmux:

```
chmod +x ./tmux/setup.sh && ./tmux/setup.sh
```

### Hyprland

1) Delete the folder at `~/.config/hypr` before running `./link`, the
  the screen will turn black for a few and return
2) After linking the hypr folder, run `hyprctl reload`
3) Everything should now be back
