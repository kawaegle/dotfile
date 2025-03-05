return {
  "insanum/mark-signs.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require('mark-signs').setup({
      builtin_marks = { ".", "<", ">", "^" },
      refresh_interval = 500,
      sign_priority = { lower=10, upper=15, builtin=8 },
      mappings = { },
    })
  end
}
