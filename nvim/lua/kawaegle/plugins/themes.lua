-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "frappe", -- latte, frappe, macchiato, mocha
--             background = {
--                 light = "mocha",
--                 dark = "mocha",
--             },
--             transparent_background = false, -- disables setting the background color.
--             show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--             term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--             dim_inactive = {
--                 enabled = false, -- dims the background color of inactive window
--                 shade = "dark",
--                 percentage = 0.15, -- percentage of the shade to apply to the inactive window
--             },
--             no_italic = false, -- force no italic
--             no_bold = false, -- force no bold
--             no_underline = false, -- force no underline
--             styles = { -- handles the styles of general hi groups (see `:h highlight-args`):
--                 comments = { "italic" }, -- change the style of comments
--                 conditionals = { "italic" },
--                 loops = {},
--                 functions = {},
--                 keywords = {},
--                 strings = {},
--                 variables = {},
--                 numbers = {},
--                 booleans = {},
--                 properties = {},
--                 types = {},
--                 operators = {},
--             },
--             color_overrides = {},
--             custom_highlights = {},
--             integrations = {
--                 cmp = true,
--                 gitsigns = true,
--                 nvimtree = true,
--                 treesitter = true,
--                 notify = false,
--                 rainbow_delimiters = true,
--                 mini = {
--                     enabled = true,
--                     indentscope_color = "",
--                 },
--                 telescope = {
--                     enabled = true,
--                 },
--             },
--         })
--         vim.cmd("colorscheme catppuccin")
--     end,
-- }
--

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      light_style = "dark",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors) end,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
