return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
      },
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy [f]ind [f]iles in CWD" })
    vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Fuzzy find [b]u[f]fer open in nvim instance" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy find [f]iles in [g]it in CWD" })
    vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Fuzzy [gr]ep in all file in CWD" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy [f]ind on vim [h]elp pages " })
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Fuzzy find on [m]an pages " })
    vim.keymap.set("n", "<leader>cq", builtin.quickfix, { desc = "Fuzzy find on [q]ui[c]kfix list " })
    vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Fuzzy find throught all [k]ey[m]aps setup" })
    vim.keymap.set("n", "<leader>ft", builtin.tags, { desc = "Fuzzy [f]ind on Ctags generates in CWD" })
  end,
}
