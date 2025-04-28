return {
  "hiphish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        --     bash = rainbow_delimiters.strategy['local'],
        --     cpp = rainbow_delimiters.strategy['local'],
        --     c = rainbow_delimiters.strategy['local'],
        --     dockerfile = rainbow_delimiters.strategy['local'],
        --     go = rainbow_delimiters.strategy['local'],
        --     gomod = rainbow_delimiters.strategy['local'],
        --     gosum = rainbow_delimiters.strategy['local'],
        --     json = rainbow_delimiters.strategy['local'],
        --     markdown = rainbow_delimiters.strategy['local'],
        --     python = rainbow_delimiters.strategy['local'],
      },
      query = {
        [""] = "rainbow-delimiters",
        --     bash = 'rainbow-blocks',
        --     cpp = 'rainbow-blocks',
        --     c = 'rainbow-blocks',
        --     dockerfile = 'rainbow-blocks',
        --     go = 'rainbow-blocks',
        --     gomod = 'rainbow-blocks',
        --     gosum = 'rainbow-blocks',
        --     json = 'rainbow-blocks',
        --     markdown = 'rainbow-blocks',
        --     python = 'rainbow-blocks',
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
