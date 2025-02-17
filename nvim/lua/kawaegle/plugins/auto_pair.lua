return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        c = { "string" },
        cpp = { "string" },
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
      },
    })

    enable_check_bracket_line = false
  end,
}
