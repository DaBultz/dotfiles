# Dotfiles

I'm using [Rotz](https://volllly.github.io/rotz/) to manage my dotfiles, as i'm doing development cross-platform,
and managing the dotfiles was complicated with chezmoi.

## Installation

1) Create a new SSH Key on the machine: [Github Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2) Install [Rotz](https://volllly.github.io/rotz/), https://volllly.github.io/rotz/docs/getting-started#installer-scripts
3) Run `rotz clone git@github.com:DaBultz/dotfiles.git` on the machine


## TODO

- [ ] Look at how to use Wezterm Workspaces (similiar to tmux sessions)
    - goal: able to open any project inside `projects`
- [ ] Look at how to make git worktrees not suck
    - How to easy switch between worktress using wezterm + neovim
