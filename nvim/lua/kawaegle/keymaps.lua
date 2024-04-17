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
keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true, desc = "move window left"})
keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true, desc = "move window down"})
keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true, desc = "move window up"})
keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true, desc = "move window right"})

-- resize window
keymap("n", "<C-Up>", ":resize +2<CR>", {noremap = true, silent = true, desc = "resize window up"})
keymap("n", "<C-Down>", ":resize -2<CR>", {noremap = true, silent = true, desc = "resize window down"})
keymap("n", "<C-Left>", ":vertical resize +2<CR>", {noremap = true, silent = true, desc = "resize window left"})
keymap("n", "<C-Right>", ":vertical resize -2<CR>", {noremap = true, silent = true, desc = "resize window right"})

-- switch or tab
keymap("n", "<S-Tab>", ":tabprevious<CR>", {noremap = true, silent = true, desc = "Roll tab into previous tab"})
keymap("n", "<Tab>", ":tabnext<CR>", {noremap = true, silent = true, desc = "roll tab into next tab"})
keymap("n", "<C-t>", ":tabnew<CR>", {noremap = true, silent = true, desc = "create new tab"})

-- make and open quickfix
keymap("n", "<leader>m", ":make<CR><CR>:copen<CR>", {noremap = true, silent = true, desc = "Start :make and open directly quickfix list"})

-- no search hightlight
keymap("n", "<leader><leader>", ":noh<CR>:let @/ = ''<CR>", {noremap = true, silent = true, desc = "disable search hightlight"})

-- save and quit
keymap("n", "<leader>ww", ":w!<CR>", {noremap = true, silent = true, desc = "force save file"})
keymap("n", "<leader>qq", ":q!<CR>", {noremap = true, silent = true, desc = "force quit file"})
keymap("n", "<leader>wq", ":wq<CR>", {noremap = true, silent = true, desc = "save and close buffer"})

-- indent selected text
keymap("v", "<", "<gv", {noremap = true, silent = true, desc = "indent selected lines left"})
keymap("v", ">", ">gv", {noremap = true, silent = true, desc = "indent selected lines right"})

-- move selected text up down
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", {noremap = true, silent = true, desc = "move up selected lines"})
keymap("n", "<A-j>", ":m '>+1<CR>gv-gv", {noremap = true, silent = true, desc = "move up selected lines"})
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", {noremap = true, silent = true, desc = "move down selected lines"})
keymap("n", "<A-k>", ":m '<-2<CR>gv-gv", {noremap = true, silent = true, desc = "move down selected lines"})
