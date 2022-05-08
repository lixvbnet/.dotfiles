local M = {}

local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"


M.plugins = {
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
    },

    user = userPlugins,
}

return M