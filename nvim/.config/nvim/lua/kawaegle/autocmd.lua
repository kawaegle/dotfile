local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd

autocmd("Filetype", {
  pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescriptreact", "json", "lua" },
  command = "setlocal shiftwidth=2 tabstop=2",
})

autocmd({ "BufWrite" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
      return
    end
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[ :%s/\s\+$//e ]])
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

-- LSP rounded border
local _border = "rounded"
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or _border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, remap = false }

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Open floating diagnostic"
    vim.keymap.set("n", "<C-M-space>", vim.diagnostic.open_float, opts)
  end,
})
