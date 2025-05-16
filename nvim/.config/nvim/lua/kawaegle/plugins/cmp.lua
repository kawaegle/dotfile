return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      preset = "default",
      ["<C-k>"] = { "scroll_documentation_up", "fallback" },
      ["<C-j>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spawant to set signatucing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    completion = {
      keyword = { range = "full" },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        -- auto_show = function(ctx)
        --   return ctx.mode ~= "cmdline" or vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
        -- end,

        border = "single",
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        window = { border = "single" },
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
      },
    },

    sources = {
      default = {
        "lsp",
        "snippets",
        "path",
        "buffer",
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "single",
      },
    },
    fuzzy = { implementation = "lua" },
  },
  opts_extend = { "sources.default" },
}
