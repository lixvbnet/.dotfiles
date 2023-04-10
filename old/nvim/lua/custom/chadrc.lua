local M = {}

local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
local userColors = require("custom.colors")


M.options = {
   user = function()
      require "custom.options"
   end,
}

M.plugins = {
   remove = {
      "max397574/better-escape.nvim",
      "folke/which-key.nvim",
      "NvChad/nvterm",
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "round",    -- default/round/slant/block/arrow
      },
   },

   override = {
      ["akinsho/bufferline.nvim"] = pluginConfs.bufferline,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
   },

   user = userPlugins,
}

-- keep this setting, so that "change theme" can work correctly
M.ui = {
   theme = "onedark",
   changed_themes = userColors.changed_themes,
   hl_override = userColors.hl_override,
}

M.mappings = require "custom.mappings"

return M