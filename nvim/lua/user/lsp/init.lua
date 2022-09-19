local lsp = require("lsp-zero")

require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {"pyright", "gopls", "clangd", "asm_lsp", "diagnisticls", "cmake", "cpptools", "bashsl"},
    automatic_installation = true,
})

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
