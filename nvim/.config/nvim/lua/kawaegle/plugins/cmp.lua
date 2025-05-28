return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = { "scroll_documentation_up", "fallback" },
      ["<C-j>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    appearance = {
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
        border = "rounded",
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        window = { border = "rounded" },
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
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
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
