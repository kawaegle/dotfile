local opts = {
    default_mappings = {
        ours = 'co',
        theirs = 'ct',
        none = 'c0',
        both = 'cb',
        next = 'cn',
        prev = 'cp',
    },
    config = {
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = 'telescope', -- command or function to open the conflicts list_opener
        highlights = { -- They must have background color, otherwise the default color will be used
            incoming = 'DiffAdd',
            current = 'DiffText',
        }
    },
}

return {
        'akinsho/git-conflict.nvim',
        version = "*",
        opts = opts,
}
