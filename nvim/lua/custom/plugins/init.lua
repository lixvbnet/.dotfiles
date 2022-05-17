-- install new plugins, or replace default config of existing plugins

return {
    -- install new plugins
    -- ["nvim-telescope/telescope-media-files.nvim"] = {
    --     after = "telescope.nvim",
    --     config = function()
    --        require("telescope").load_extension "media_files"
    --     end,
    -- },


    -- replace default config of existing plugins
    -- ["NvChad/base46"] = {
    --     commit = "ef1ae11",     -- use a specified version (git commit)
    --     after = "packer.nvim",
    --     config = function()
    --        local ok, base46 = pcall(require, "base46")
  
    --        if ok then
    --           base46.load_theme()
    --        end
    --     end,
    --  },

    ["NvChad/base46"] = {
       commit = "2e925ef",      -- use a specified version (git commit)
       after = "packer.nvim",
       config = function()
          local ok, base46 = pcall(require, "base46")

          if ok then
             base46.load_theme()
          end
      end,
    },


    ["NvChad/nvterm"] = {
        commit = "4efafd5",     -- use a specified version (git commit)
        config = function()
           require "plugins.configs.nvterm"
        end,
    },
    
}