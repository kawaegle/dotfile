local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'wbthomason/packer.nvim' }, -- packet manager
    { 'stevearc/dressing.nvim' }, -- UI styler
    { "NStefan002/speedtyper.nvim",
      cmd = "Speedtyper",
      dependencies = { 'rcarriga/nvim-notify' },
      opts = {}
    },
    { 'folke/tokyonight.nvim' }, -- themes
    { 'mbbill/undotree' }, -- manage undo as a tree
    { 'romainl/vim-qf' }, -- better quickfix management (TODO: implement it with telescope)
    { 'nvim-telescope/telescope.nvim', --telescope picker file finder
      tag = '0.1.4',
      dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope-ui-select.nvim',
          'rcarriga/nvim-notify'
      }},
    { 'nvim-treesitter/nvim-treesitter' }, -- treesitter algo
    { 'nvim-tree/nvim-tree.lua', -- file tree explorer
      dependencies = { 'nvim-tree/nvim-web-devicons' }},
    { 'Nero-F/vim-tek-header' }, -- need to remove it soon as possible
    { 'lewis6991/gitsigns.nvim' }, --show git symbols on modified file
    { 'nvim-lua/popup.nvim' }, --popup plugin needed by most of plugins
    { 'HiPhish/nvim-ts-rainbow2' }, -- treesitter parentheses coloring
    { 'normen/vim-pio' }, -- support platformio on nvim
    { 'windwp/nvim-autopairs' }, --allow fast autopairs based on treesitter
    { 'numToStr/Comment.nvim', --comment depends on the filetype
      dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' }},
    { 'nvim-lualine/lualine.nvim', -- statusline easy to configure
      dependencies = { 'nvim-tree/nvim-web-devicons' }},
    { 'folke/todo-comments.nvim', -- manage what I have ToDo
          dependencies = { "nvim-lua/plenary.nvim" }},
    { 'VonHeikemen/lsp-zero.nvim', -- LSP management
      branch = 'v3.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        -- Autocompletion
        {'onsails/lspkind-nvim'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }},
})
