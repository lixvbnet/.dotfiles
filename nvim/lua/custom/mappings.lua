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

M.nvterm = {
   i = {
      -- toggle terminal (horizontal)
      ["<C-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
            -- when switching to terminal in insert mode, make sure change to terminal mode
            vim.fn.feedkeys(termcodes('<ESC>i'))
         end,
         "   toggle horizontal term",
      },
      -- new terminal in current folder
      ["<A-t>"] = {
         function()
            local cwd = vim.fn.expand('%:p:h')
            require("nvterm.terminal").new "horizontal"
            require("nvterm.terminal").send("cd " .. cwd .. "&& clear", "horizontal")
            vim.fn.feedkeys(termcodes('<ESC>i'))
         end,
         "   new horizontal term in current folder",
      },
   },
   n = {
      -- toggle terminal (horizontal)
      ["<C-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
      -- new terminal in current folder
      ["<A-t>"] = {
         function()
            local cwd = vim.fn.expand('%:p:h')
            require("nvterm.terminal").new "horizontal"
            require("nvterm.terminal").send("cd " .. cwd .. "&& clear", "horizontal")
            vim.fn.feedkeys(termcodes('<ESC>i'))
         end,
         "   new horizontal term in current folder",
      },
   },
   t = {
      -- toggle terminal (horizontal)
      ["<C-t>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
   },
}

M.nvimtree = {
   i = {
      ["<C-n>"] = { "<cmd> :NvimTreeToggle <CR><Esc>", "   toggle nvimtree" },
   },
}

return M
