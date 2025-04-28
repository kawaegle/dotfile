return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  -- cmd = { "Mason" },
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
        "clang-format",
        "cpplint",
        "stylua",
        -- "gofmt",
        "goimports",
        "isort",
        "black",
        "luacheck",
        -- "golangcilint",
        "flake8",
      },
    })
  end,
}
