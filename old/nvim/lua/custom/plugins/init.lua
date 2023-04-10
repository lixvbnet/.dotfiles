-- install new plugins, or override default plugin definitions

local V = require "custom.plugins.versions"

return {
   ---------------------- new plugins ----------------------
   ["jose-elias-alvarez/null-ls.nvim"] = {
      commit = V.null_ls_nvim,
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["stevearc/aerial.nvim"] = {
      commit = V.aerial_nvim,
      after = {"nvim-treesitter", "telescope.nvim"},
      config = function()
         require("custom.plugins.outline").setup()
      end,
      setup = function()
         nvchad.packer_lazy_load "telescope.nvim"
         nvchad.packer_lazy_load "aerial.nvim"
      end,
   },

   ["akinsho/toggleterm.nvim"] = {
      commit = V.toggleterm_nvim,
      tag = 'v1.*',
      config = function()
         require("custom.plugins.toggleterm").setup()
      end,
   },

   ["is0n/jaq-nvim"] = {
      commit = V.jaq_nvim,
      after = "toggleterm.nvim",
      config = function()
         require("custom.plugins.jaq").setup()
      end,
   },


   -------------------- default plugins --------------------
   ["nvim-lua/plenary.nvim"] = {
      commit = V.plenary_nvim,
   },
   ["lewis6991/impatient.nvim"] = {
      commit = V.impatient_nvim,
   },

   ["wbthomason/packer.nvim"] = {
      commit = V.packer_nvim,
   },

   ["NvChad/extensions"] = {
      commit = V.extensions,
   },

   ["NvChad/base46"] = {
      commit = V.base46,
   },

   -- ["NvChad/nvterm"] = {
   --    commit = V.nvterm,
   -- },

   ["kyazdani42/nvim-web-devicons"] = {
      commit = V.nvim_web_devicons,
   },

   ["feline-nvim/feline.nvim"] = {
      commit = V.feline_nvim,
      config = function()
         require "custom.plugins.statusline"    -- use custom statusline
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      commit = V.bufferline_nvim,
   },

   ["lukas-reineke/indent-blankline.nvim"] = {
      commit = V.indent_blankline_nvim,
   },

   ["NvChad/nvim-colorizer.lua"] = {
      commit = V.nvim_colorizer_lua,
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      commit = V.nvim_treesitter,
   },

   ["lewis6991/gitsigns.nvim"] = {
      commit = V.gitsigns_nvim,
      config = function()
         require "custom.plugins.gitsigns"    -- use custom gitsigns config
      end,
   },

   ["williamboman/nvim-lsp-installer"] = {
      commit = V.nvim_lsp_installer,
   },

   ["neovim/nvim-lspconfig"] = {
      commit = V.nvim_lspconfig,
   },

   ["ray-x/lsp_signature.nvim"] = {
      commit = V.lsp_signature_nvim,
   },

   ["andymass/vim-matchup"] = {
      commit = V.vim_matchup,
   },

   -- ["max397574/better-escape.nvim"] = {
   --    commit = V.better_escape_nvim,
   -- },

   ["rafamadriz/friendly-snippets"] = {
      commit = V.friendly_snippets,
   },

   ["hrsh7th/nvim-cmp"] = {
      commit = V.nvim_cmp,
   },

   ["L3MON4D3/LuaSnip"] = {
      commit = V.LuaSnip,
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      commit = V.cmp_luasnip,
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      commit = V.cmp_nvim_lua,
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      commit = V.cmp_nvim_lsp,
   },

   ["hrsh7th/cmp-buffer"] = {
      commit = V.cmp_buffer,
   },

   ["hrsh7th/cmp-path"] = {
      commit = V.cmp_path,
   },

   ["windwp/nvim-autopairs"] = {
      commit = V.nvim_autopairs,
   },

   -- ["goolord/alpha-nvim"] = {
   --    -- commit = V.alpha_nvim,     -- can't config disabled plugin
   -- },

   ["numToStr/Comment.nvim"] = {
      commit = V.Comment_nvim,
   },

   ["kyazdani42/nvim-tree.lua"] = {
      commit = V.nvim_tree_lua,
      cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },    -- customize commands
      setup = function()
         nvchad.packer_lazy_load "nvim-tree.lua"
      end,
   },

   ["nvim-telescope/telescope.nvim"] = {
      commit = V.telescope_nvim,
   },
}