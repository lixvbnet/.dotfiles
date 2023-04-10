local jaq = require "jaq-nvim"

local cmds = {
   default = "toggleterm",       -- Default UI
   external = {
      go = "go run %",
      python = "python3 %",
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      javascript = "node %",
      typescript = "ts-node",
      sh = "sh %",
      robot = "robot %",
      c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
      cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
      php = "php %",
      perl = "perl %",
      ruby = "ruby %",
      groovy = "groovy %",
      bat = "cmd /c",
      applescript = "osascript",
      rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
      racket = "racket",
      dart = "dart",
   },
   internal = {
      lua = "luafile %",
      vim = "source %",
   },
}

local ui = {
   startinsert = false,     -- Start in insert mode
   wincmd = false,          -- Switch back to current file after using Jaq

   -- Floating Window / FTerm settings
   float = {
      border = "single",            -- Floating window border (see ':h nvim_open_win')
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,
      border_hl = "FloatBorder",    -- Highlight group for floating window/border (see ':h winhl')
      float_hl = "Normal",
      blend = 0,                    -- Floating Window Transparency (see ':h winblend')
   },

   terminal = {
      position = "bot",
      line_no = false,
      size = vim.o.lines * 0.3,
   },

   toggleterm = {
      position = "horizontal",      -- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
      size = vim.o.lines * 0.3,
   },

   quickfix = {
      position = "bot",             -- Position of quickfix window
      size = vim.o.lines * 0.3,
   },
}

local M = {}

M.setup = function()
   jaq.setup {
      cmds = cmds,
      ui = ui,
   }
end

return M
