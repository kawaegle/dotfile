vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescriptreact' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'go' },
  command = 'setlocal autoindent noexpandtab tabstop=4 shiftwidth=4'
})

vim.api.nvim_create_autocmd({"BufWrite"}, {
    pattern = "*",
    callback = function ()
        if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
            return
        end
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd [[ :%s/\s\+$//e ]]
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})
