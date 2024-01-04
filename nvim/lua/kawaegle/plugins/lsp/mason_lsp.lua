return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "VonHeikemen/lsp-zero.nvim",
  },
  config = function()
    local mason = require("mason")
    local lsp = require("lsp-zero")
    local mason_lspconfig = require("mason-lspconfig")
    lsp.extend_lspconfig()
    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
          "clangd",
          "dockerls",
          "gopls",
          "jsonls",
          "pyright",
          "docker_compose_language_service",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
      handlers = {lsp.default_setup},
    })
  end,
}
