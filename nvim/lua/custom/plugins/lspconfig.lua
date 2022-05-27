local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "gopls" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = function(client, bufnr)
            attach(client, bufnr)
            -- setup aerial outline
            require("aerial").on_attach(client, bufnr)
         end,
         capabilities = capabilities,
      }
   end
end

return M
