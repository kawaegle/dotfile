local status_lsp, lsp = pcall(require, 'lsp-zero')
local status_cmp, cmp = pcall(require, 'cmp')
local status_luasnip, luasnip = pcall(require, 'luasnip')
local status_lspkind, lspkind = pcall(require, 'lspkind')

if not status_lsp or not status_cmp
or not status_luasnip or not status_lspkind then
    return
end

lsp.preset("recommended")
lsp.ensure_installed({
    "clangd",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "jsonls",
    "pyright",
})

require('mason').setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    sign_icons = {
        error = '✘',
        warn = '',
        hint = '⚑',
        info = '',
    },
})

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
})


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


lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
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

lsp.on_attach(function(client, buffnr)
    local opts = {buffer = buffnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<C-M-space>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<C-l>", function() vim.diagnostic.goto_next() end, opts)
end)

lsp.setup()
