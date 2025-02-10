-- load defaults i.e lua_lsp


require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" , "rust_analyzer", "clangd", "pyright","ts_ls", "lemminx", "bashls"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
require('lspconfig').jdtls.setup({ --настройка lsp server для Java
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-23",
            path = "/opt/jdk-23",
            default = true,
          }
        }
      }
    }
  }
})
-- configuring single server, example: typescript
-- lspconfig.python_lsp_server.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
