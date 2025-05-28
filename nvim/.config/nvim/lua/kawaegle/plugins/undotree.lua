return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup({
      position = "left", -- right", "bottom"
      window = {
        winblend = 10,
      },
    })
  end,
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
