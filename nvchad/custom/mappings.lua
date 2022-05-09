local map = require("core.utils").map

-- map("n", "<leader>q", "<cmd> :q <CR>")

-- Move current line/block up/down with Alt-Up/Down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-Up>", ":m .-2<CR>==")
map("n", "<A-Down>", ":m .+1<CR>==")


