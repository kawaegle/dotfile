local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 0,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    mouse = "n",
    pumheight = 10,
    showmode = true,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 1000,
    undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes:2",
    wrap = true,
    scrolloff = 8,
    sidescrolloff = 8,
    listchars = "eol:↓,trail:●,space:·",
    list = true,
    termguicolors = true,
    encoding = 'utf-8',
}

vim.opt.shortmess:append "c"

for i, j in pairs(options) do
    vim.opt[i] = j
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '/bin/python3'
vim.g.editorconfig = true

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescriptreact' },
  command = 'setlocal shiftwidth=2 tabstop=2'
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
