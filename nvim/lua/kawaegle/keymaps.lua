local keymap = vim.keymap.set

--Remap space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- toggle NERD tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = " Toggle Nvim tree"})

-- split and vsplit
keymap("n", "<leader>v", ":vsplit<CR>", {noremap = true, silent = true, desc = "split Verticaly"})
keymap("n", "<leader>s", ":split<CR>", {noremap = true, silent = true, desc = "Split horizontaly"})

-- move auround window
keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true, desc = ""})

-- resize window
keymap("n", "<C-Up>", ":resize -2<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-Down>", ":resize +2<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-Left>", ":vertical resize -2<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-Right>", ":vertical resize +2<CR>", {noremap = true, silent = true, desc = ""})

-- switch or tab
keymap("n", "<S-Tab>", ":tabprevious<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<Tab>", ":tabnext<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<C-t>", ":tabnew<CR>", {noremap = true, silent = true, desc = ""})

-- make and open quickfix
keymap("n", "<leader>m", ":make<CR><CR>:copen<CR>", {noremap = true, silent = true, desc = ""})

-- no search hightlight
keymap("n", "<leader><leader>", ":noh<CR>", {noremap = true, silent = true, desc = ""})

-- save and quit
keymap("n", "<leader>ww", ":w!<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<leader>qq", ":q!<CR>", {noremap = true, silent = true, desc = ""})
keymap("n", "<leader>wq", ":wq<CR>", {noremap = true, silent = true, desc = ""})

-- indent selected text
keymap("v", "<", "<gv", {noremap = true, silent = true, desc = ""})
keymap("v", ">", ">gv", {noremap = true, silent = true, desc = ""})

-- move selected text up down
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", {noremap = true, silent = true, desc = ""})
keymap("n", "<A-j>", ":m '>+1<CR>gv-gv", {noremap = true, silent = true, desc = ""})
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", {noremap = true, silent = true, desc = ""})
keymap("n", "<A-k>", ":m '<-2<CR>gv-gv", {noremap = true, silent = true, desc = ""})

-- sort selected line
keymap("v", "<leader>s", ":sort<CR>", {noremap = true, silent = true, desc = ""})

keymap('n', '<leader>u', vim.cmd.UndotreeToggle, {noremap = true, silent = true, desc = "toggle undo tree power "})


