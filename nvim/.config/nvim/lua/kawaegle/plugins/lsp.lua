return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspStart", "LspStop" },
  dependencies = {
    { "mason-org/mason-lspconfig.nvim" },
  },
  config = function()
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    })
  end,
}
