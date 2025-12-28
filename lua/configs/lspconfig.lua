-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Icons для диагностики (остается без изменений)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Список серверов (исправлены имена)
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
  "hls",  -- "hls" → "haskell_language_server"
  "racket_langserver",
  "lua_ls",                   -- "gls" → "lua_ls"
  "yamlls",
  "gopls"
}

-- Включаем серверы с дефолтными настройками NvChad
vim.lsp.enable(servers)

-- Кастомные конфигурации через vim.lsp.config()
vim.lsp.config("jdtls", {
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
})

vim.lsp.config("html", {
  filetypes = { "html", "htm", "jsp" },
})

vim.lsp.config("docker_compose_language_service", {
  filetypes = { "yaml" },
})

vim.lsp.config("haskell_language_server", {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
})

vim.lsp.config("racket_langserver", {
  cmd = { "racket", "-l", "racket-langserver" },
})

