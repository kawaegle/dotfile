local opts = {
  filetypes = {
    "*",

    -- Excluded filteypes.
    "!lazy", -- Commit hashes get highlighted sometimes.
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true,
    AARRGGBB = false,

    rgb_fn = false,
    hsl_fn = false,
    css = true,
    css_fn = true,
    tailwind = true,

    sass = { enable = false, parsers = { "css" } },
    -- mode = "background",
    mode = "virtualtext",
    virtualtext = "  ",
    always_update = true,
  },
}

return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = opts,
}
