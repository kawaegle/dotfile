local colors = {
    blue   = '#80A0FF',
    cyan   = '#569B80',
    black  = '#24283B',
    white  = '#C6C6C6',
    red    = '#FF5189',
    violet = '#B261AE',
    grey   = '#3E4970'
}

local custom_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

require('lualine').setup {
    options = {
        theme = custom_theme,
        always_divide_middle = true,
        component_separators = '|',
        section_separators = {left = '', right = ''},
    },
    sections = {
        lualine_a = {{'mode', separator = { left = '', right = '' }, right_padding = 2}},
        lualine_b = {'filename', 'branch'},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {{'diff', separator = {left = ''}}},
        lualine_z = {{'location', separator = {right = ''}}}
      },
    inactive_sections = {
        lualine_a = {{'filename', separator = {left = ''}, right_padding = 2}},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {{'location', separator = {right = ''}, left_padding = 2}}
    },
    tabline = {},
    extensions = {},
}

