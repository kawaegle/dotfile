-- options
require('user.options')
-- keymaps
require('user.keymaps')
-- pluginS
require('user.plugins')
-- colorscheme
require('user.colorscheme')
-- completion
require('user.cmp')
-- lsp
require('user.lsp')
require('user.dap')
-- treesitter
require('user.treesitter')
-- commentstring
require('user.comment')
-- autopairs
require('user.autopairs')
-- gitsigns
require('user.gitsigns')
-- lua line
require('user.lualine')
-- use nerd tree instead of netrw
require("nvim-tree").setup()
