local map = require("core.utils").map

-- map("n", "<leader>q", "<cmd> :q <CR>")

-- Ctrl + q to exit insertion/terminal mode
map("i", "<C-q>", "<Esc>")
map("t", "<C-q>", "<C-\\><C-n>")

-- Ctrl + s to save file
map("i", "<C-s>", "<Esc>:w<CR>")

-- Move current line/block up/down with Alt-Up/Down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-Up>", ":m .-2<CR>==")
map("n", "<A-Down>", ":m .+1<CR>==")
