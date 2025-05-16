return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspStart", "LspStop" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "saghen/blink.cmp" },
    },
    config = function()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig")[server_name].setup({ capabilities = capabilities })
          end,
        },
      })
    end,
  },
}
