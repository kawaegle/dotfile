vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescriptreact' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'go' },
  command = 'setlocal autoindent noexpandtab tabstop=4 shiftwidth=4'
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    callback = function ()
        if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
            return
        end
        vim.cmd [[ :%s/\s\+$//e ]]
    end,
})
