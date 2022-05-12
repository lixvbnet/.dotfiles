local map = nvchad.map

-- get rid of jk binding
vim.keymap.del("t", "jk")

-- map("n", "<leader>q", "<cmd> :q <CR>")

-- Ctrl + q as ESC
map("n", "<C-q>", "<Esc>")
map("i", "<C-q>", "<Esc>")
map("o", "<C-q>", "<Esc>")
map("v", "<C-q>", "<Esc>")
map("c", "<C-q>", "<C-\\><C-n>")
map("t", "<C-q>", "<C-\\><C-n>")

-- Ctrl + s to save file
map("i", "<C-s>", "<Esc>:w<CR>")

-- Alt + w to switch between windows
map("n", "<A-w>", "<C-w>w")
map("i", "<A-w>", "<Esc> <C-w>w")
map("t", "<A-w>", "<C-\\><C-n> <C-w>w")

-- Move current line/block up/down with Alt-Up/Down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-Up>", ":m .-2<CR>==")
map("n", "<A-Down>", ":m .+1<CR>==")
