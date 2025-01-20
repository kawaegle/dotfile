return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
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
          require("telescope.themes").get_dropdown {}
        },
      },
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "List all buffer open in nvim instance"})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Fuzzy find files in git in cwd" })
    vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Fuzzy find string in cwd" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "FZF on vim help pages "})
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "FZF on man pages "})
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "telescope on quickfix list "})
    vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "show and search all keymaps setup "})
    vim.keymap.set("n", "<leader>ft", builtin.tags, { desc = "search throught all tags"})
  end
}
