local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end,
    },
}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'mbbill/undotree'
    use 'romainl/vim-qf'
    use {'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {'nvim-lua/plenary.nvim'}
}
use {'nvim-treesitter/nvim-treesitter',
{run = ':TSUpdate'}
    }
    use {'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
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
    }
}
use {'Nero-F/vim-tek-header'} -- need to remove it soon as possible
use {'folke/todo-comments.nvim',
requires = "nvim-lua/plenary.nvim"
    }
    use {'nvim-lua/popup.nvim'} --popup plugin needed by most of plugins
    use {'HiPhish/nvim-ts-rainbow2'}
    use {'windwp/nvim-autopairs'} --allow fast autopairs based on treesitter
    use {'numToStr/Comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring'
} --comment depends on the filetype
use {'lewis6991/gitsigns.nvim'} --show git symbols on modified file
use {'normen/vim-pio'} --support platformio on nvim
use {'nvim-lualine/lualine.nvim', --tabline easy to configure
requires = {'nvim-tree/nvim-web-devicons'}
    }
    use {'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
use {'folke/todo-comments.nvim',
requires = "nvim-lua/plenary.nvim"
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
