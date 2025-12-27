-- load defaults i.e lua_lsp

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "postgres_lsp",
  "docker_compose_language_service",
  "html",
  "cssls",
  "rust_analyzer",
  "clangd",
  "pyright",
  "ts_ls",
  "lemminx",
  "bashls",
  "dockerls",
  "cmake",
  "hls",
  "racket_langserver",
  "gls",
  "yamlls",
}
local nvlsp = require "nvchad.configs.lspconfig"
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
require("lspconfig").jdtls.setup { --настройка lsp server для Java
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-23",
            path = "/opt/jdk-23",
            default = true,
          },
        },
      },
    },
  },
}
lspconfig.html.setup {
  filetypes = { "html", "htm", "jsp" }, -- Добавляем "jsp"
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- configuring single server, example: typescript
-- lspconfig.python_lsp_server.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
require("lspconfig").docker_compose_language_service.setup {
  filetypes = { "yaml" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

require("lspconfig").hls.setup {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
}
require("lspconfig").racket_langserver.setup {
  cmd = { "racket", "-l", "racket-langserver" },
}
