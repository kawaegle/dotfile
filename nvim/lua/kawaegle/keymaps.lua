local keymap = vim.keymap.set

--Remap space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = {noremap = true, silent = true}

-- toggle NERD tree
opts.desc = "toggle nvimtree"
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- split and vsplit
opts.desc = "split verticaly"
keymap("n", "<leader>v", ":vsplit<CR>", opts)
opts.desc = "split horizontaly"
keymap("n", "<leader>s", ":split<CR>", opts)

-- move auround window
opts.desc = "move to left"
keymap("n", "<C-h>", "<C-w>h", opts)
opts.desc = "move to up"
keymap("n", "<C-j>", "<C-w>j", opts)
opts.desc = "move to down"
keymap("n", "<C-k>", "<C-w>k", opts)
opts.desc = "move to right"
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize window
opts.desc = "resize horizontal +2 px"
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
opts.desc = "resize horizontal -2 px"
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
opts.desc = "resize vertical +2 px"
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
opts.desc = "resize vertical -2 px"
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- switch or tab
opts.desc = "go to previous tab"
keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)
opts.desc = "go to next tab"
keymap("n", "<Tab>", ":tabnext<CR>", opts)
opts.desc = "create new tab"
keymap("n", "<C-t>", ":tabnew<CR>", opts)

-- make and open quickfix
opts.desc = "do :make and open the quickfix list"
keymap("n", "<leader>m", ":make<CR><CR>Telescope quickfix<CR>", opts)

-- no search hightlight
opts.desc = "remove the hightlight of search"
keymap("n", "<leader><leader>", ":noh<CR>:let @/ = ''<CR>", opts)

-- save and quit
opts.desc = "force save"
keymap("n", "<leader>ww", ":w!<CR>", opts)
opts.desc = "force quit"
keymap("n", "<leader>qq", ":q!<CR>", opts)
opts.desc = "save using tee for sudo file"
keymap("n", "<leader>sw", ":w !sudo tee %<CR>", opts)
opts.desc = "save and quit"
keymap("n", "<leader>wq", ":wq<CR>", opts)

-- indent selected text
opts.desc = "indent to left"
keymap("v", "<", "<gv", opts)
opts.desc = "indent to right"
keymap("v", ">", ">gv", opts)

-- move selected text up down
opts.desc = "move visual selection up"
keymap({"n","v"}, "<A-j>", ":m '>+1<CR>gv-gv", opts)
opts.desc = "move visual selection down"
keymap({"n", "v"}, "<A-k>", ":m '<-2<CR>gv-gv", opts)

-- Git conflict in telescope
opts.desc = "create a quickfix of git conflict and open it using Telescope"
keymap("n", "<leader>cT", ":GitConflictListQf<cr>:q<cr>:Telescope quickfix<cr>", opts)

