local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not status_ok then
    return
end

local servers = {
    "bashls",
    "gopls",
    "diagnosticls",
    "clangd",
    "pyright",
    "sumneko_lua",
    "cmake",
    "asm_lsp",
}

for _, server_name in pairs(servers) do
    local server_available, server_to_install = lsp_installer.get_server(server_name)
    if not server_to_install:is_installed() then
        server_to_install:install()
    end
end

lsp_installer.on_server_ready(function (server)
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    server:setup(opts)
end)
