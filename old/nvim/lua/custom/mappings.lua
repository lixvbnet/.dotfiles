local M = {}

-- disable default mappings
M.disabled = {
   i = {
      ["jk"] = "",
      ["<C-x>"] = "",
      -- disable: go to beginning of line
      ["<C-b>"] = "",
      -- disable: navigate within insert mode
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
   },
   n = {
      ["<leader>uu"] = "",
      -- disable: copy whole file
      ["<C-c>"] = "",
      
      -- disable: switch between windows
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",

      -- disable: new buffer
      ["<S-b>"] = "",

      -- disable: nvterm default bindings
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      -- disable: pick a hidden nvterm
      ["<leader>pt"] = "",
   },
   t = {
      ["jk"] = "",
      -- disable: nvterm default bindings (in terminal mode)
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
   },
}

-- define new or override default mappings
M.general = {
   i = {
      ["<C-a>"] = { "<ESC>^i", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },
      ["<C-d>"] = { '<C-o>"_dd', " delete line" },               -- delete line
      ["<C-j>"] = { '<C-o>d0', "ﲕ delete to beginning of line" }, -- delete to beginning of line
      ["<C-k>"] = { '<C-o>D' , "ﲖ delete to end of line" },       -- delete to end of line
      ["<C-u>"] = { '<C-o>u', "碑 undo" },                -- undo
      ["<C-r>"] = { '<C-o><C-r>', "淚 undo" },            -- redo
   },
   n = {
      ["<C-a>"] = { "^", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },
      ["<leader>q"] = { "<cmd> :qa <CR>" },           -- quit all
   },
   v = {
      ["<leader>q"] = { "<cmd> :qa <CR>" },           -- quit all
   },
}

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.toggleterm = {
   i = {
      -- Ctrl + t to toggle terminal (horizontal)
      ["<C-t>"] = { "<ESC><cmd> ToggleTerm direction=horizontal <CR>", "   toggle horizontal term" },
      -- Alt + t to toggle terminal and cd into current folder
      ["<A-t>"] = {
         function()
            local cwd = vim.fn.expand('%:p:h')
            vim.cmd(string.format('TermExec cmd="cd %s && clear" dir="%s" direction="horizontal" go_back=0', cwd, cwd))
            vim.fn.feedkeys(termcodes('<ESC>i'))   -- when switching to terminal in insert mode, make sure change to terminal mode
         end,
         "   toggle horizontal term and cd into current folder",
      },
      -- Alt + h to show git history for current file
      ["<A-h>"] = {
         function()
            local filepath = vim.fn.expand('%')
            local cwd = vim.fn.expand('%:p:h')
            local cmd = ""
            if filepath == nil or filepath == "" then
               cmd = "lazygit"
            else
               cmd = "lazygit -f " .. filepath
            end
            vim.cmd(string.format('TermExec cmd="%s && exit" dir="%s" direction="float" go_back=0', cmd, cwd))
            vim.fn.feedkeys(termcodes('<ESC>i'))
         end,
      },
   },
   n = {
      -- Ctrl + t to toggle terminal (horizontal)
      ["<C-t>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "   toggle horizontal term" },
      -- Alt + t to toggle terminal and cd into current folder
      ["<A-t>"] = {
         function()
            local cwd = vim.fn.expand('%:p:h')
            vim.cmd(string.format('TermExec cmd="cd %s && clear" dir="%s" direction="horizontal" go_back=0', cwd, cwd))
         end,
         "   toggle horizontal term and cd into current folder",
      },
      -- Ctrl + h to show git history
      ["<C-h>"] = {
         function()
            vim.cmd(string.format('TermExec cmd="lazygit && exit" direction="float" go_back=0'))
         end,
      },
      -- Alt + h to show git history for current file
      ["<A-h>"] = {
         function()
            local filepath = vim.fn.expand('%')
            local cwd = vim.fn.expand('%:p:h')
            local cmd = ""
            if filepath == nil or filepath == "" then
               cmd = "lazygit"
            else
               cmd = "lazygit -f " .. filepath
            end
            vim.cmd(string.format('TermExec cmd="%s && exit" dir="%s" direction="float" go_back=0', cmd, cwd))
         end,
      },
   },
   t = {
      -- Ctrl + t to toggle terminal (horizontal)
      ["<C-t>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "   toggle horizontal term" },
      -- Alt + t to toggle terminal in current folder
      ["<A-t>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "   toggle horizontal term" },
   },
}

M.nvimtree = {
   i = {
      -- toggle
      ["<C-n>"] = { "<cmd> :NvimTreeToggle <CR><Esc>", "   toggle nvimtree" },
      -- find file
      ["<A-n>"] = { "<cmd> NvimTreeFindFile! <CR><Esc>", "   focus nvimtree" },
   },
   n = {
      -- toggle
      ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
      -- find file
      ["<A-n>"] = { "<cmd> NvimTreeFindFile! <CR>", "   focus nvimtree" },
   },
}

return M
