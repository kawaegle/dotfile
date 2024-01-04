return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "VonHeikemen/lsp-zero.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lsp = require("lsp-zero")
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()
    lsp.extend_lspconfig()

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    })

    cmp.setup({
            formatting = {
            fields = {"abbr", "kind", "menu"},
            format = function(entry, item)
                item.kind = lspkind.presets.default[item.kind]
                item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return item
            end
        },
        mapping = cmp_mappings,
        sources = {
            {name = 'nvim_lsp'},
            {name = 'luasnip'},
            {name = 'buffer'},
            {name = 'path'},
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        experimental = {
            ghost_text = true,
            native_menu = false,
        },
    })

    -- cmp.setup({
    --   completion = {
    --     completeopt = "menu,menuone,preview,noselect",
    --   },
    --   snippet = { -- configure how nvim-cmp interacts with snippet engine
    --     expand = function(args)
    --       luasnip.lsp_expand(args.body)
    --     end,
    --   },
    --   confirm_opts = {
    --      behavior = cmp.ConfirmBehavior.Replace,
    --      select = false,
    --   },
    --   experimental = {
    --     ghost_text = true,
    --     native_menu = false,
    --   },
    --   mapping = cmp_mappings,
    --   -- sources for autocompletion
    --   sources = cmp.config.sources({
    --     { name = "nvim_lsp" },
    --     { name = "luasnip" }, -- snippets
    --     { name = "path" }, -- file system paths
    --     { name = "buffer" }, -- text within current buffer
    --   }),
    --   -- configure lspkind for vs-code like pictograms in completion menu
    --   formatting = {
    --     fields = {"abbr", "kind", "menu"},
    --     format = function(entry, item)
    --         item.kind = lspkind.presets.default[item.kind]
    --         item.menu = ({
    --             nvim_lsp = "[LSP]",
    --             luasnip = "[LuaSnip]",
    --             buffer = "[Buffer]",
    --             path = "[Path]",
    --         })[entry.source.name]
    --         return item
    --     end
    --     },
    -- })
  end
}
