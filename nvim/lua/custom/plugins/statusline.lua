local present, feline = pcall(require, "feline")

if not present then
   return
end

local options = {
   colors = require("base46").get_colors "base_30",
   lsp = require "feline.providers.lsp",
   lsp_severity = vim.diagnostic.severity,
}

options.icon_styles = {
   default = {
      left = "",
      right = " ",
   },
   arrow = {
      left = "",
      right = "",
   },

   block = {
      left = " ",
      right = " ",
   },

   round = {
      left = "",
      right = "",
   },

   slant = {
      left = " ",
      right = " ",
   },
}

options.separator_style = options.icon_styles[nvchad.load_config().plugins.options.statusline.separator_style]

options.main_icon = {
   provider = function()
      --   return "   " .. options.mode_colors[vim.fn.mode()][1] .. " "
      return "  "
   end,

   hl = "FelineIcon",

   right_sep = {
      str = options.separator_style.right,
      hl = "FelineIconSeparator",
   },
}

options.dir_name = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
      end
      return " " .. icon .. " " .. dir_name .. " "
   end,

   hl = "FelineDirName",
   -- hl = {
   --    fg = options.colors.white,
   --    bg = options.colors.lightbg2,
   -- },
}

--  Git

options.diff = {
   add = {
      provider = "git_diff_added",
      hl = "Feline_diffIcons",
      icon = "  ",
   },

   change = {
      provider = "git_diff_changed",
      hl = "Feline_diffIcons",
      icon = "  ",
   },

   remove = {
      provider = "git_diff_removed",
      hl = "Feline_diffIcons",
      icon = "  ",
   },
}

options.git_branch = {
   provider = "git_branch",
   hl = "Feline_diffIcons",
   icon = "  ",
}

-- lsp

options.diagnostic = {
   error = {
      provider = "diagnostic_errors",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.ERROR)
      end,

      hl = "Feline_lspError",
      icon = "  ",
   },

   warning = {
      provider = "diagnostic_warnings",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.WARN)
      end,
      hl = "Feline_lspWarning",
      icon = "  ",
   },

   hint = {
      provider = "diagnostic_hints",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.HINT)
      end,
      hl = "Feline_LspHints",
      icon = "  ",
   },

   info = {
      provider = "diagnostic_info",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.INFO)
      end,
      hl = "Feline_LspInfo",
      icon = "  ",
   },
}

options.lsp_icon = {
   provider = function()
      if next(vim.lsp.buf_get_clients()) ~= nil then
         return "    LSP "
      else
         return " "
      end
   end,
   hl = "Feline_LspIcon",
}

options.lsp_progress = {
   provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
         local msg = Lsp.message or ""
         local percentage = Lsp.percentage or 0
         local title = Lsp.title or ""
         local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

         local success_icon = {
            "",
            "",
            "",
         }

         local ms = vim.loop.hrtime() / 1000000
         local frame = math.floor(ms / 120) % #spinners

         if percentage >= 70 then
            return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
         end

         return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
   end,
   hl = "Feline_LspProgress",
}

options.current_line = {
   provider = function()
      local current_line = vim.fn.line "."
      local current_col = vim.fn.col "."
      local total_line = vim.fn.line "$"

      -- if current_col < 10 then
      --   current_col = " " .. current_col
      -- end

      if current_line == 1 then
         return " " .. current_line .. ":" .. current_col .. "/" .. "Top "
      elseif current_line == vim.fn.line "$" then
         return " " .. current_line .. ":" .. current_col .. "/" .. "Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)

      -- if result < 10 then
      --   result = " " .. result
      -- end

      return " " .. current_line .. ":" .. current_col .. "/" .. result .. "%% "
   end,

   hl = "Feline_CurrentLine",
}

local fn = vim.fn

local function get_color(group, attr)
   return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

options.mouse_mode = {
   provider = function()
      local mouse = vim.api.nvim_get_option "mouse"
      if mouse == "" then
         return " ⤯ "
      else
         return ""
      end
   end,
}

options = nvchad.load_override(options, "feline-nvim/feline.nvim")

local function add_table(tbl, inject)
   if inject then
      table.insert(tbl, inject)
   end
end

-- components are divided in 3 sections
options.left = {}
options.middle = {}
options.right = {}

-- left
-- add_table(options.left, options.main_icon)
add_table(options.left, options.dir_name)
add_table(options.left, options.git_branch)
add_table(options.left, options.diff.add)
add_table(options.left, options.diff.change)
add_table(options.left, options.diff.remove)

add_table(options.middle, options.lsp_progress)

-- right
add_table(options.right, options.mouse_mode)
add_table(options.right, options.diagnostic.error)
add_table(options.right, options.diagnostic.warning)
add_table(options.right, options.diagnostic.hint)
add_table(options.right, options.diagnostic.info)
add_table(options.right, options.lsp_icon)
add_table(options.right, options.current_line)

-- Initialize the components table
options.components = { active = {} }

options.components.active[1] = options.left
options.components.active[2] = options.middle
options.components.active[3] = options.right

options.theme = {
   fg = get_color("Feline", "fg#"),
   bg = get_color("Feline", "bg#"),
}

feline.setup {
   theme = options.theme,
   components = options.components,
}
