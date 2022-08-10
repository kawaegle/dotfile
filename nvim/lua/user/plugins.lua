local fn = vim.fn

--auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
    }
    print "Installing packer close and reopen Neovim ..."
    vim.cmd [[packadd packer.nvim]]
end

-- autoreload nvim
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

--use protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init {
    display = {
        open_fn = function()
        return require("packer.util").float {border = "rounded"}
        end,
    },
}

-- add your plugins here
return packer.startup(function(use)
    use {'wbthomason/packer.nvim'} --packer piugin manager
    use {'nvim-lua/popup.nvim'} --popup plugin needed by most of plugins
    use {'wbthomason/plenary.nvim'} --plugin needed by a lot of plugins
    use {'folke/tokyonight.nvim'} --colorscheme
    use {'romainl/vim-qf'} --use quickfick list
    use {'windwp/nvim-autopairs'} --allow fast autopairs based on treesitter
    use {'numToStr/Comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring'} --let's comment depends on the filetype
    use {'hrsh7th/nvim-cmp'} --completion api
    use {'hrsh7th/cmp-buffer'} --completion api from file
    use {'hrsh7th/cmp-path'} --completion api from filepath
    use {'hrsh7th/cmp-cmdline'} --completion api from command line
    use {'hrsh7th/cmp-nvim-lsp'} --completion api from lsp server
    use {'saadparwaiz1/cmp_luasnip'} --completion api from LuaSnip
    use {'L3MON4D3/LuaSnip'} --snipet sugestion
    use {'rafamadriz/friendly-snippets'} --collection of snippet from vscode
    use {'onsails/lspkind-nvim'} --lsp icon
    use {'neovim/nvim-lspconfig'} --configuration for lsp server
    use {'williamboman/nvim-lsp-installer'} --installer of LSP server
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} --treesitter support for all nvim
    use {'p00f/nvim-ts-rainbow'} --rainbow bracket with treesitter
    use {'lewis6991/gitsigns.nvim'} --show git symbols on modified file
    use {'normen/vim-pio'} --support platformio on nvim
    use {'Yohannfra/Vim-Epitech'} -- epitech header
    use {'ludovicchabant/vim-gutentags'} --support ctags file
    use {'preservim/tagbar'} --support ctags file
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
