local map = require("core.utils").map

-- map("n", "<leader>q", "<cmd> :q <CR>")

-- Move current line/block up/down with Alt-Up/Down
map("n", "<A-Up>", "<Esc>:m .-2<CR>")
map("n", "<A-Down>", "<Esc>:m .+1<CR>")
