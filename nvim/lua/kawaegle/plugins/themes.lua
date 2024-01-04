-- return {
--   'scottmckendry/cyberdream.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("cyberdream").setup({
--       -- Recommended - see "Configuring" below for more config options
--       transparent = false,
--       italic_comments = true,
--       hide_fillchars = false,
--       borderless_telescope = false,
--     })
--     vim.cmd("colorscheme cyberdream") -- set the colorscheme
--   end,
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
        light_style = "day",
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
