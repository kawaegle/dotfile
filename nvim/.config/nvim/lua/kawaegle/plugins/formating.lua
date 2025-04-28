return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
        python = { "isort", "black" },
        lua = { "stylua" },
        go = { "gofmt", "goimport" },
        json = { "jq" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "[M]ake  [p]retty using proper formatting tools" })
  end,
}
