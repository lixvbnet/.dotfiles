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

local present, cmp = pcall(require, "cmp")
if not present then
   return M
end
M.cmp = {
    mapping = {
      --   ["<Tab>"] = cmp.mapping.confirm {
      --       behavior = cmp.ConfirmBehavior.Replace,
      --       select = true,
      --   },
      --   ["<S-Tab>"] = cmp.mapping.confirm {
      --       behavior = cmp.ConfirmBehavior.Replace,
      --       select = true,
      --   },
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

return M