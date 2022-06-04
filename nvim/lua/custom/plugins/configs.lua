-- overriding default plugin configs
local M = {}


-- show git history for current file/folder
local function show_git_history(node)
   -- print(node.absolute_path)
   local cwd = vim.fn.expand('%:p:h')
   vim.cmd(string.format('TermExec cmd="lazygit -f %s && exit" dir="%s" direction="float" go_back=0', node.absolute_path, cwd, cwd))
end

M.nvimtree = {
   view = {
      hide_root_folder = true,
      mappings = {
         custom_only = false,
         list = {
            -- Right/Left or l/h to open/close
            { key = {"<Right>", "l" }, action = "edit", mode = "n"},
            { key = {"<Left>", "h" }, action = "close_node", mode = "n"},
            
            -- Alt + h to show git history for current file/folder
            { key = {"<A-h>", "H" }, action = "print_path", action_cb = show_git_history },
         },
      },
   },
}


M.treesitter = {
   ensure_installed = {
      "lua",
      "vim",
      "make",
   },
}


local present, cmp = pcall(require, "cmp")
if present then
   M.cmp = {
      mapping = {
         ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
         },
         -- allow select items with Up/Down
         ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
               fallback()
            end
         end, {
            "i",
            "s",
         }),
         ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
               fallback()
            end
         end, {
            "i",
            "s",
         }),
      },
   }
end


return M
