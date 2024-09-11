## NVim configuration

This is a minimal NVim configuration for a daily use.

### Keybindings

Here are some keybindings that are used in this config :
`<leader>`: space as leader  
`<leader>km`: Telescope fuzzy finder for all keymap setup on nvim  
`<C-n>` (control n) : toggles NvimTree (file explorer on left side)  
`<leader>v` (space v) : equivalent to `:vsplit`  
`<leader>s` (space s) : equivalent to `:split`  
`<leader>m` (space m) : for C, C++ or even go and other language that can use make, run Makefile and opens program  
`<leader><leader>` (double space) : no highlight for search  
`<leader>ww` (space double w) : force save equivalent to `:w!`  
`<leader>qq` (space double q) : force quit equivalent to `:q!`  
`<leader>wq` (space w q) : equivalent to `:wq`  

### Plugins list
- autopair to automaticly close `'"({[`
- cmp completions framework 
- colorhex to see color based on hexa, base64, html code, and more
- git_conflict solver
- git sign to see if line were modified
- icons for nerdtree
- LSP using mason and lsp-zero
- NvimTree file explorer
- pio arduino alternative
- plenary
- better quickfix list 
- rainbow pair 
- statusline 
- Telescope
- todo_comment 
- treesiter
- undotree

### Features

The lualine was modified to get a beautiful and useful line, without denaturing the vim look and feel.  
Note that you will need [nerd fonts](https://github.com/ryanoasis/nerd-fonts) installed for it to look fresh with those tasteful rounded corners.

We use NvimTree to have a nice file explorer.

LSP has been updated to Mason in order to use the last technologies in neovim. It works well and it's all configured for you !

DAP is on the way to be configured

### Special thanks

Thanks to [Kawaegle](https://github.com/kawaegle) for its neovim config base, which is so awesome, and for its clear code, that I found easy to edit to make it mine !  
Thanks to [EvanKoe](https://github.com/evankoe) for supporting, search, and contributions  
