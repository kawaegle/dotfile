return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lazy_status = require("lazy.status")
    require("lualine").setup({
      options = {
        icons_enabled = true,
        disabled_filetype = {"NvimTree"},
        section_separators = { left = '', right = '' },
        component_separators = "|",
        theme = "tokyonight",
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {},

        lualine_x = {
          'diagnostics',
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates
          -- },
          {
            'filetype',
            colored = true,   -- Displays filetype icon in color if set to true
            icon_only = true, -- Display only an icon for filetype
            icon = { align = 'right' },
          },
        },
        lualine_y = {},
        lualine_z = {'location', ''}
      },
      inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
