-- overriding default plugin configs
local M = {}


-- M.nvterm = {
--     mappings = {
--         toggle = {
--            float = "<A-i>",
--            horizontal = "<A-h>",
--            vertical = "<A-v>",
--         },
--         new = {
--            horizontal = "<leader>h",
--            vertical = "<leader>v",
--         },
--      },
-- }


local present, t_actions = pcall(require, "telescope.actions")
if present then
   M.telescope = {
      defaults = {
         mappings = {
            i = { ["<C-q>"] = t_actions.close }, -- fix mapping conflict
         },
      },
   }
end


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
