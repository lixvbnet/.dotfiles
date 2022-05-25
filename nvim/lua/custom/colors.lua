local M = {}

-- override specific colors in themes
-- M.changed_themes = {
--    onedark = {
--       base_30 = {
--          green = "#008000",
--       },
--    },
-- }

-- create new highlight groups, or override default ones
M.hl_override = {
   -- Gitsigns.nvim
   DiffAdd = {
      fg = "#4c7e00",         -- green (from vscode)
      -- fg = "#87d787",      -- code color in onedark
   },

   DiffAdded = {
      fg = "green",
   },

   DiffChange = {
      fg = "#007fa1",         -- blue (from vscode)
   },

   DiffChangeDelete = {
      fg = "red",
   },

   DiffModified = {
      fg = "orange",
   },

   DiffDelete = {
      fg = "red",
   },

   DiffRemoved = {
      fg = "red",
   },
}

return M