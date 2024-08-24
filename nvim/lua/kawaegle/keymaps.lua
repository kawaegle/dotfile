local keymap = vim.keymap.set

--Remap space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = {noremap = true, silent = true}

-- toggle NERD tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", table.insert(opts, {desc = " Toggle Nvim tree"}))

-- split and vsplit
keymap("n", "<leader>v", ":vsplit<CR>", table.insert(opts, {desc = "split Verticaly"}))
keymap("n", "<leader>s", ":split<CR>", table.insert(opts, {desc = "Split horizontaly"}))

-- move auround window
keymap("n", "<C-h>", "<C-w>h", table.insert(opts, {desc = "move window left"}))
keymap("n", "<C-j>", "<C-w>j", table.insert(opts, {desc = "move window down"}))
keymap("n", "<C-k>", "<C-w>k", table.insert(opts, {desc = "move window up"}))
keymap("n", "<C-l>", "<C-w>l", table.insert(opts, {desc = "move window right"}))

-- resize window
keymap("n", "<C-Up>", ":resize +2<CR>", table.insert(opts, {desc = "resize window up"}))
keymap("n", "<C-Down>", ":resize -2<CR>", table.insert(opts, {desc = "resize window down"}))
keymap("n", "<C-Left>", ":vertical resize +2<CR>", table.insert(opts, {desc = "resize window left"}))
keymap("n", "<C-Right>", ":vertical resize -2<CR>", table.insert(opts, {desc = "resize window right"}))

-- switch or tab
keymap("n", "<S-Tab>", ":tabprevious<CR>", table.insert(opts, {desc = "Roll tab into previous tab"}))
keymap("n", "<Tab>", ":tabnext<CR>", table.insert(opts, {desc = "roll tab into next tab"}))
keymap("n", "<C-t>", ":tabnew<CR>", table.insert(opts, {desc = "create new tab"}))

-- make and open quickfix
keymap("n", "<leader>m", ":make<CR><CR>:copen<CR>", table.insert(opts, {desc = "Start :make and open directly quickfix list"}))

-- no search hightlight
keymap("n", "<leader><leader>", ":noh<CR>:let @/ = ''<CR>", table.insert(opts, {desc = "disable search hightlight"}))

-- save and quit
keymap("n", "<leader>ww", ":w!<CR>", table.insert(opts, {desc = "force save file"}))
keymap("n", "<leader>qq", ":q!<CR>", table.insert(opts, {desc = "force quit file"}))
keymap("n", "<leader>wq", ":wq<CR>", table.insert(opts, {desc = "save and close buffer"}))

-- indent selected text
keymap("v", "<", "<gv", table.insert(opts, {desc = "indent selected lines left"}))
keymap("v", ">", ">gv", table.insert(opts, {desc = "indent selected lines right"}))

-- move selected text up down
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", table.insert(opts, {desc = "move up selected lines"}))
keymap("n", "<A-j>", ":m '>+1<CR>gv-gv", table.insert(opts, {desc = "move up selected lines"}))
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", table.insert(opts, {desc = "move down selected lines"}))
keymap("n", "<A-k>", ":m '<-2<CR>gv-gv", table.insert(opts, {desc = "move down selected lines"}))

-- Git conflict in telescope
keymap("n", "<leader>cT", ":GitConflictListQf<cr>:q<cr>:Telescope quickfix<cr>", table.insert(opts, {desc = "Show all git conflict on telescope"}))
