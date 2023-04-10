local aerial = require "aerial"

local M = {}

M.setup = function()
   aerial.setup {
      -- Priority list of preferred backends for aerial.
      -- This can be a filetype map (see :help aerial-filetype-map)
      backends = { "treesitter", "lsp", "markdown" },

      icons = {
         markdown = {
            Interface = "I",
         },
         make = {
            Interface = "契",
         },
         ["_"] = {
            -- The underscore key is for any unmatched filetypes
         },
      },

      -- Enum: persist, close, auto, global
      --   persist - aerial window will stay open until closed
      --   close   - aerial window will close when original file is no longer visible
      --   auto    - aerial window will stay open as long as there is a visible
      --             buffer to attach to
      --   global  - same as 'persist', and will always show symbols for the current buffer
      close_behavior = "close",

      -- Set to false to remove the default keybindings for the aerial buffer
      default_bindings = true,

      -- Enum: prefer_right, prefer_left, right, left, float
      -- Determines the default direction to open the aerial window. The 'prefer'
      -- options will open the window in the other direction *if* there is a
      -- different buffer in the way of the preferred direction
      default_direction = "float",

      -- Disable aerial on files with this many lines
      disable_max_lines = 10000,

      -- Disable aerial on files this size or larger (in bytes)
      disable_max_size = 10000000,

      -- When jumping to a symbol, highlight the line for this many ms.
      -- Set to false to disable
      highlight_on_jump = false,

      -- When true, aerial will automatically close after jumping to a symbol
      close_on_select = true,

      on_attach = function(bufnr) end,
   }

   vim.cmd([[
      " customize highlight
      hi link AerialInterfaceIcon Function
   ]])

   -- integrate aerial into telescope
   require("telescope").load_extension "aerial"
end

return M
