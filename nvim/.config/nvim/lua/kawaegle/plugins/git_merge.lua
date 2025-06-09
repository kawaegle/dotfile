local opts = {
  default_mappings = {
    ours = "co",
    theirs = "ct",
    none = "c0",
    both = "cb",
    next = "cn",
    prev = "cp",
  },
  config = {
    default_mappings = true,
    default_commands = true,
    disable_diagnostics = false,
    list_opener = function()
      require("snacks.nvim").picker.qflist()
    end,
    highlights = {
      incoming = "DiffAdd",
      current = "DiffText",
    },
  },
}

return {
  "akinsho/git-conflict.nvim",
  version = "v2.*",
  config = true,
  opts = opts,
}
