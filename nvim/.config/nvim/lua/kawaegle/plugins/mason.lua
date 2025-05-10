return {
  "williamboman/mason.nvim",
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
        "stylua",
        "goimports",
        "isort",
        "black",
        "luacheck",
        "golangci-lint",
        "flake8",
        "clangd",
        "gopls",
        "basedpyright",
        "dockerls",
        "jsonls",
        "docker_compose_language_service",
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
