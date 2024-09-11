return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")
      local autotag = require("nvim-ts-autotag")
      -- setup autotag
      autotag.setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        })
      -- configure treesitter
      treesitter.setup({
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 10000 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
          end,
        },
        indent = { enable = true },
        autotag = {
          enable = true,
        },
        auto_install = false,
        sync_install = false,
        ensure_installed = {
            "cpp",
            "bash",
            "dockerfile",
            "go",
            "gomod",
            "gosum",
            "json",
            "markdown",
            "python",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
