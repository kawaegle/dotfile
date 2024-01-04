return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "rcarriga/nvim-notify",
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
          themes.get_dropdown {
          }
        }
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
    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Fuzzy find files in git in cwd" })
    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
    vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "FZF on vim help pages "})
    vim.keymap.set("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { desc = "FZF on man pages "})
    vim.keymap.set("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", { desc = "telescope on quickfix list "})
    vim.keymap.set("n", "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "show and search all keymaps setup "})
  end
}
