local map = nvchad.map


-- disable whichkey
nvchad.no_WhichKey_map()

-- replace close_buffer function (leader + x)
nvchad.close_buffer = function(force)
   if vim.bo.buftype == "terminal" then
      vim.api.nvim_win_hide(0)
      return
   end

   force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"
   local close_cmd = force and ":bd!" or ":bp | bd" .. vim.fn.bufnr()
   vim.cmd(close_cmd)
end


-- get rid of jk binding
-- vim.keymap.del("t", "jk")

-- leader + m to toggle mouse mode
map("n", "<leader>m", function()
   local mouse = vim.api.nvim_get_option "mouse"
   if mouse == "" then
      vim.api.nvim_set_option("mouse", "a")
   else
      vim.api.nvim_set_option("mouse", "")
   end
end)

-- toggle theme (already in default mappings)
-- map("n", "<leader>tt", function() require('base46').toggle_theme() end)

-- Ctrl + q as ESC (can use Ctrl + ] instead)
-- map({"n", "i", "o", "v", "s"}, "<C-q>", "<Esc>")
-- map("c", "<C-q>", "<C-\\><C-n>")
-- map("t", "<C-q>", "<C-\\><C-n>")

-- Ctrl + s to save file
map("i", "<C-s>", "<Esc>:w<CR>")
map("v", "<C-s>", "<cmd>:w<CR>")

-- Shift + Tab to inverse Tab (de-tab current line)
-- map("i", "<S-Tab>", "<C-d>")

-- better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Alt + w to switch between windows (also Ctrl + w, w)
map("n", "<A-w>", "<C-w>w")
map("i", "<A-w>", "<Esc> <C-w>w")
map("t", "<A-w>", "<C-\\><C-n> <C-w>w")
map("t", "<C-w>w", "<C-\\><C-n> <C-w>w")

-- Ctrl + w, h/j/k/l for window navigation
map("t", "<C-w>h", "<C-\\><C-n> <C-w>h")
map("t", "<C-w>l", "<C-\\><C-n> <C-w>l")
map("t", "<C-w>j", "<C-\\><C-n> <C-w>j")
map("t", "<C-w>k", "<C-\\><C-n> <C-w>k")


-- Move current line/block up/down with Alt-k/j
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-k>", "<cmd> m .-2<CR>==")
map("n", "<A-j>", "<cmd> m .+1<CR>==")

map("v", "<A-k>", ":move '<-2<CR>gv-gv")
map("v", "<A-j>", ":m '>+1<CR>gv-gv")

-- Move current line/block up/down with Alt-Up/Down
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

map("n", "<A-Up>", "<cmd> m .-2<CR>==")
map("n", "<A-Down>", "<cmd> m .+1<CR>==")

map("v", "<A-Up>", ":move '<-2<CR>gv-gv")
map("v", "<A-Down>", ":m '>+1<CR>gv-gv")

-- Resize window with Alt-Shift-h/j/k/l
map("i", "<A-S-h>", "<cmd> vertical resize -2 <CR>")
map("i", "<A-S-l>", "<cmd> vertical resize +2 <CR>")
map("i", "<A-S-j>", "<cmd> resize -2 <CR>")
map("i", "<A-S-k>", "<cmd> resize +2 <CR>")

map("n", "<A-S-h>", "<cmd> vertical resize -2 <CR>")
map("n", "<A-S-l>", "<cmd> vertical resize +2 <CR>")
map("n", "<A-S-j>", "<cmd> resize -2 <CR>")
map("n", "<A-S-k>", "<cmd> resize +2 <CR>")

map("t", "<A-S-h>", "<cmd> vertical resize -2 <CR>")
map("t", "<A-S-l>", "<cmd> vertical resize +2 <CR>")
map("t", "<A-S-j>", "<cmd> resize -2 <CR>")
map("t", "<A-S-k>", "<cmd> resize +2 <CR>")


-- Ctrl + p to find files (Telescope)
map("n", "<C-p>", "<cmd> :Telescope find_files <CR>")
-- Alt + f to find text (Telescope)
map("n", "<A-f>", "<cmd> :Telescope live_grep <CR>")

-- Ctrl + y to show outline (Telescope aerial)
map("i", "<C-y>", "<cmd>Telescope aerial<CR>")
map("n", "<C-y>", "<cmd>Telescope aerial<CR>")
-- Alt + y to toggle aerial outline
map("i", "<A-y>", "<cmd>AerialToggle<CR>")
map("n", "<A-y>", "<cmd>AerialToggle<CR>")

-- Alt + r to run code (Jaq)
map("i", "<A-r>", "<ESC><cmd>Jaq<CR>")
map("n", "<A-r>", "<cmd>Jaq<CR>")

-- Shift + t to create new buffer
map("n", "T", "<cmd> enew <CR>")
