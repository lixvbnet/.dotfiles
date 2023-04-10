-- overriding default plugin configs
local M = {}


M.bufferline = {
   options = {
      custom_areas = {
         right = function()
            -- return {
            --    { text = "%@Toggle_theme@" .. vim.g.toggle_theme_icon .. "%X" },
            --    { text = "%@Quit_vim@ %X" },
            -- }
         end,
      },
   },
}


-- show git history for current file/folder
local function show_git_history(node)
   -- print(node.absolute_path)
   local filepath = node.absolute_path
   local cwd = vim.fn.expand('%:p:h')
   local cmd = ""
   if filepath == nil or filepath == "" then
      cmd = "lazygit"
   else
      cmd = "lazygit -f " .. filepath
   end
   vim.cmd(string.format('TermExec cmd="%s && exit" dir="%s" direction="float" go_back=0', cmd, cwd))
end

M.nvimtree = {
   auto_reload_on_write = true,
   create_in_closed_folder = false,
   reload_on_bufenter = false,
   view = {
      side = "left",
      width = 30,
      adaptive_size = true,
      centralize_selection = false,
      preserve_window_proportions = false,
      hide_root_folder = false,
      mappings = {
         custom_only = false,
         list = {
            -- Right/Left or l/h to open/close
            { key = {"<Right>", "l" }, action = "edit", mode = "n"},
            { key = {"<Left>", "h" }, action = "close_node", mode = "n"},

            -- Alt + n to go back to previous window
            { key = {"<A-n>"}, action = "go_back", action_cb = function(node) vim.cmd("wincmd p") end},
            -- Alt + h to show git history for current file/folder
            { key = {"<A-h>"}, action = "print_path", action_cb = show_git_history },
         },
      },
   },
   root_dirs = { "/usr/local/go/src", "~/go/pkg/mod" },
   prefer_startup_root = true,
   sync_root_with_cwd = false,
   update_focused_file = {
      enable = false,
      update_root = true,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
      change_dir = {
         enable = true,
         global = false,
         restrict_above_cwd = true,
      },
   },
   git = {
      enable = true,
      ignore = true,
      timeout = 400,
   },
   renderer = {
      highlight_git = true,
      icons = {
         webdev_colors = true,
         git_placement = "after",
         padding = " ",
         symlink_arrow = " ➛ ",
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
         },
         glyphs = {
            default = "",
            symlink = "",
            folder = {
               arrow_closed = "",
               arrow_open = "",
               default = "",
               open = "",
               empty = "",
               empty_open = "",
               symlink = "",
               symlink_open = "",
            },
            git = {
               unstaged = "✗",
               staged = "✓",
               unmerged = "",
               renamed = "➜",
               -- untracked = "★",
               -- untracked = "",
               untracked = "+",
               -- deleted = "",
               deleted = "-",
               ignored = "◌",
            },
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
