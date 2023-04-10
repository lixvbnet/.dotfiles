local null_ls = require "null-ls"

-- Format code: <leader> + fm

local sources = {
   null_ls.builtins.formatting.prettier.with {
      filetypes = { "html", "css", "json", "yaml", "markdown" },
   },

   null_ls.builtins.formatting.autopep8, -- python formatting
   null_ls.builtins.formatting.stylua, -- lua formatting
   null_ls.builtins.formatting.gofmt, -- golang formatting
   null_ls.builtins.formatting.goimports,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      --   on_attach = function(client)
      --      if client.resolved_capabilities.document_formatting then
      --         vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      --      end
      --   end,
   }
end

return M
