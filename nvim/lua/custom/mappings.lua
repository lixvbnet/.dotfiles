local M = {}

-- disable default mappings
M.disabled = {
   i = {
      ["jk"] = "",
      ["<C-b>"] = "",
   },
   n = {
      ["<leader>uu"] = "",
      -- disable: copy whole file
      ["<C-c>"] = "",
      
      -- disable: switch between windows
      -- ["<C-h>"] = "",
      -- ["<C-l>"] = "",
      -- ["<C-j>"] = "",
      -- ["<C-k>"] = "",

      -- disable: new buffer
      ["<S-b>"] = "",
   },
   t = {
      ["jk"] = "",
   },
}

-- define new or override default mappings
M.general = {
   i = {
      ["<C-a>"] = { "<ESC>^i", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },
   },
   n = {
      ["<C-a>"] = { "^", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },
      ["<leader>q"] = { "<cmd> :qa <CR>" },     -- quit all
   },
}

M.nvimtree = {
   i = {
      ["<C-n>"] = { "<cmd> :NvimTreeToggle <CR><Esc>", "   toggle nvimtree" },
   },
}

M.outline = {
   i = {
      ["<C-y>"] = { "<cmd> :SymbolsOutline <CR><Esc>", "פּ Toggle symbols outline" },
   },
   n = {
      ["<C-y>"] = { "<cmd> :SymbolsOutline <CR>", "פּ Toggle symbols outline" },
      ["<leader>o"] = { "<cmd> :SymbolsOutline <CR>", "פּ Toggle symbols outline" },
   },
}

return M
