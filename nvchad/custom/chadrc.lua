local M = {}

local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"


M.options = {
    user = function()
        require("custom.options")
    end,
}

M.plugins = {
    remove = {
        "max397574/better-escape.nvim",
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
        ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
    },

    user = userPlugins,
}

return M