local toggleterm = require "toggleterm"

local M = {}

M.setup = function()
   toggleterm.setup {
      -- size = 20,                -- size can be a number or function which is passed the current terminal
      size = function(term)
         if term.direction == "horizontal" then
           return vim.o.lines * 0.3
         elseif term.direction == "vertical" then
           return vim.o.columns * 0.5
         end
      end,
      hide_numbers = true,      -- hide the number column in toggleterm buffers
      start_in_insert = true,
      
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,       -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      
      -- open_mapping = [[<c-t>]],
      insert_mappings = true,   -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals

      persist_size = false,
      direction = "float",      -- 'vertical' | 'horizontal' | 'window' | 'float'
      close_on_exit = true,     -- close the terminal window when the process exits
      shell = vim.o.shell,      -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
         -- The border key is *almost* the same as 'nvim_win_open'
         -- see :h nvim_win_open for details on borders however
         -- the 'curved' border is a custom border type
         -- not natively supported but implemented in this plugin.
         -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
         border = "curved",
         -- width = <value>,
         -- height = <value>,
         winblend = 0,
      },
   }
end

return M
