return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lsp
        "clangd",
        "basedpyright",
        "gopls",
        "docker_compose_language_service",
        "dockerls",
        -- formating
        "black",
        "isort",
        "goimports",
        "golangci-lint",
        -- dap
        "cpptools",
        "delve",
      },
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      },
      run_on_start = true,
      auto_update = false,
    })
  end,
}
