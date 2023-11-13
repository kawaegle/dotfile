local status_telescope, telescope = pcall(require, 'telescope')
local status_builtin, builtin = pcall(require, 'telescope.builtin')
if not status_telescope or not status_builtin then
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gr', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set("n", "<leader>t", ":TodoTelescope<CR>")

telescope.setup{
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension("notify")
