return {
  'saghen/blink.cmp',
  event = "InsertEnter",
  dependencies = {
    'rafamadriz/friendly-snippets',
    "L3MON4D3/LuaSnip", -- snippet engine
  },

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'default',
      ["<C-k>"] = {'scroll_documentation_up', 'fallback'},
      ["<C-j>"] = {'scroll_documentation_down', 'fallback'},
      ["<CR>"] = {'select_and_accept', 'fallback'},
      ["<Tab>"] = {'select_next', 'snippet_forward', 'fallback'},
      ["<S-Tab>"] = {'select_prev', 'snippet_backward', 'fallback'},
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = true,
        -- Show the ghost text when an item has been selected
        show_with_selection = true,
        -- Show the ghost text when no item has been selected, defaulting to the first item
        show_without_selection = false,
      },
    },


    -- documentation = { auto_show = true, auto_show_delay_ms = 500 },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    snippets = { preset = 'luasnip' },
    -- ensure you have the `snippets` source (enabled by default)
    sources = {
      default = { 'lsp', 'snippets', 'path', 'buffer' },
    },
    signature = { enabled = true }
  },
  opts_extend = { "sources.default" },
}
