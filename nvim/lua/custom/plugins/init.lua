-- install new plugins, or override default plugin definitions

return {
    -- install new plugins
    -- ["nvim-telescope/telescope-media-files.nvim"] = {
    --     after = "telescope.nvim",
    --     config = function()
    --        require("telescope").load_extension "media_files"
    --     end,
    -- },


    -- override default plugin definitions
    -- ["NvChad/base46"] = {
    --    commit = "ad78b9f",      -- use a specified version (git commit)
    -- },


    -- ["NvChad/nvterm"] = {
    --     commit = "4efafd5",     -- use a specified version (git commit)
    -- },

    ["feline-nvim/feline.nvim"] = {
        config = function()
          require "custom.plugins.statusline"
        end
    }
    
}