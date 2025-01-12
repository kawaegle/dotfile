local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd

autocmd('Filetype', {
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescriptreact', 'json', 'lua' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

autocmd('Filetype', {
  pattern = { 'go', 'c', 'cpp' },
  command = 'setlocal autoindent noexpandtab tabstop=4 shiftwidth=4'
})

autocmd({"BufWrite"}, {
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

autocmd("VimEnter", {
  callback = function()
    if fn.argc() == 0 then
      vim.cmd.NvimTreeOpen()
      return true
    elseif fn.isdirectory(fn.argv()[1]) ~= 0 then
      vim.cmd.NvimTreeOpen(fn.argv()[1])
      return true
    end
  end,
})

autocmd("BufEnter", {
  callback = function(data)
    if fn.isdirectory(data.file) ~= 0 then
      vim.cmd.NvimTreeOpen(data.file)
      return true
    end
  end,
})
