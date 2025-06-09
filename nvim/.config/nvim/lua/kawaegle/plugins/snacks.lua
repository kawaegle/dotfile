return {
  "folke/snacks.nvim",
  dependencies = { "folke/todo-comments.nvim" },
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    lazygit = { enabled = false },
  },
  keys = {
    {
      "<leader>tc",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "fuzzy find [t]odo in qui[c]kfix list",
    },
    {
      "<leader>m",
      function()
        vim.cmd("make")
        vim.cmd("cwindow")
        Snacks.picker.qflist()
      end,
      desc = "[m]ake and open quickfix",
    },
    {
      "<leader>qc",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Fuzzy find in [q]ui[c]kfix List",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.man()
      end,
      desc = "Fuzzy [f]ind [m]an Pages",
    },
    {
      "<leader>km",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "find [k]ey [m]aps",
    },
    {
      "<leader>gr",
      function()
        Snacks.picker.grep()
      end,
      desc = "Buffers",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Fuzzy [f]ind [h]elp Pages",
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gt",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>lS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>D",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
  },
}
