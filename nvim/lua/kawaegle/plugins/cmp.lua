return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local lsp = require("lsp-zero")

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp_mapping = {
      ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

      ["<CR>"] = cmp.mapping.confirm { select = true },
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
     end,{"i", "s"}),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end,{"i", "s"}),
    }

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'path'},
        {name = 'buffer',
          option = {
            get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
          }
        },
      },

      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      view = {native_menu = false},
      formatting = {
        format = lspkind.cmp_format({
          mode = 'text_symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
        })},
     experimental = {
        ghost_text = true,
      },
      mapping = cmp_mapping
    })
  end
}
