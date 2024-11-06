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
    default_mappings = true,
    default_commands = true,
    disable_diagnostics = false,
    list_opener = 'telescope',
    highlights = {
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
