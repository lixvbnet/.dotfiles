local map = nvchad.map

-- get rid of jk binding
-- vim.keymap.del("t", "jk")


-- example: map to a function
-- map("t", "<C-h>", function() require("nvterm.terminal").toggle "horizontal" end)

-- leader + m to toggle mouse mode
map("n", "<leader>m", function()
    local mouse = vim.api.nvim_get_option("mouse")
    if mouse == "" then
        vim.api.nvim_set_option("mouse", "a")
    else
        vim.api.nvim_set_option("mouse", "")
    end
end)

-- toggle theme
map("n", "<leader>tt", function() require('base46').toggle_theme() end)

-- leader + q to quit
map("n", "<leader>q", "<cmd> :q <CR>")

-- Ctrl + q as ESC
map({"n", "i", "o", "v", "s"}, "<C-q>", "<Esc>")
map("c", "<C-q>", "<C-\\><C-n>")
map("t", "<C-q>", "<C-\\><C-n>")

-- Ctrl + s to save file
map("i", "<C-s>", "<Esc>:w<CR>")

-- Shift + Tab to inverse Tab
-- map("i", "<S-Tab>", "<C-d>")

-- better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Alt + w to switch between windows
map("n", "<A-w>", "<C-w>w")
map("i", "<A-w>", "<Esc> <C-w>w")
map("t", "<A-w>", "<C-\\><C-n> <C-w>w")

-- Move current line/block up/down with Alt-Up/Down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-Up>", ":m .-2<CR>==")
map("n", "<A-Down>", ":m .+1<CR>==")

map("v", "<A-Up>", ":move '<-2<CR>gv-gv")
map("v", "<A-Down>", ":m '>+1<CR>gv-gv")

-- Ctrl + p to find files (Telescope)
map("n", "<C-p>", "<cmd> :Telescope find_files <CR>")
