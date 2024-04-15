# NVIM Config

## Requirements 

- `git`, `make`, `unzip`, `gcc`
- `ripgrep`
- `fzf` 
- `node` and `npm` for github copilot
- `cmake` and GCC or MSVC


## TODO:

- [ ] Add refactoring support
    - [ ] `<Leader>rr` to rename the current variable
    - [ ] Make the edit inlined, and show live preview of the changes 
- [ ] Format git commit messages to 72 characters wide
- [ ] Add support for `neogit` or other git plugins
- [ ] Use neovide instead of nvim in terminal
    - How would this work? with the `--wsl` option? 
    - How would i open a project hosted in `wsl`? maybe with a project picker, since every project would be inside 1 folder (can be shared on windows)
- [ ] Windows Support
- [ ] Automate Setting up development enviornment
    - Could be a seperate project
- [ ] Add rainbow delimeters
- [ ] Increase the color of sentiment.nvim matching

## REDO TODO:

- [ ] Add eslint Language Server
- [ ] https://github.com/nvimtools/none-ls.nvim
- [ ] Improve telescope in a monorepo
    - [ ] By default only search in the current project
    - [ ] By Appending `..` it will search in the parent project
    - [ ] Auto discovery of package.jsons
    - [ ] Switch project using telescope (maybe use sessions)
- [ ] Improve indent line, so it's close to VSCode

## Consider:

- https://github.com/andersevenrud/nvim_context_vt
- https://github.com/nvim-treesitter/nvim-treesitter-context
- https://github.com/filipdutescu/renamer.nvim (or similiar)
- https://github.com/gregorias/coerce.nvim
- https://github.com/Wansmer/treesj
- https://github.com/debugloop/telescope-undo.nvim (if i'm adding undotree)
- https://github.com/danymat/neogen
- https://github.com/folke/todo-comments.nvim
- https://github.com/ray-x/lsp_signature.nvim
- https://github.com/b0o/SchemaStore.nvim
- https://github.com/folke/trouble.nvim
- https://github.com/nvim-pack/nvim-spectre
- https://github.com/abecodes/tabout.nvim
- https://github.com/nguyenvukhang/nvim-toggler
- https://github.com/xiyaowong/virtcolumn.nvim
- https://github.com/piersolenski/telescope-import.nvim
- https://github.com/stevearc/dressing.nvim
- https://github.com/stevearc/oil.nvim
- https://github.com/ggandor/leap.nvim
- https://github.com/otavioschwanck/arrow.nvim (or hapoon)
- https://github.com/vague2k/huez.nvim
- https://github.com/puremourning/vimspector
- https://github.com/dmmulroy/ts-error-translator.nvim
- https://github.com/luckasRanarison/tailwind-tools.nvim
- https://github.com/anuvyklack/hydra.nvim

