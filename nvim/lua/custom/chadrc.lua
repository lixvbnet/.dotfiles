local M = {}

local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"


M.options = {
   user = function()
      require "custom.options"
   end,
}

M.plugins = {
   remove = {
      "max397574/better-escape.nvim",
      "folke/which-key.nvim",
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "round",
      },
   },

   override = {
      ["NvChad/nvterm"] = pluginConfs.nvterm,
      ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
      ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
   },

   user = userPlugins,
}

-- keep this setting, so that "change theme" can work correctly
M.ui = {
   theme = "onedark",
}

M.mappings = require "custom.mappings"

return M