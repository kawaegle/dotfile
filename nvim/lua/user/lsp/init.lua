local lsp = require("lsp-zero")
local dap = require("dap")

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
    ensure_installed = {"pyright", "gopls", "clangd", "diagnosticls", "cmake", "bashls"},
    automatic_installation = true,
})

lsp.preset('lsp-compe')
lsp.setup()
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '',
    hint = '⚑',
    info = ''
  }
})

require("mason-nvim-dap").setup({
    ensure_installed = {"cpptools"},
    automatic_setup = true,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities

vim.diagnostic.config({
  virtual_text = true
})
