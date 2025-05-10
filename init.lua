if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end

vim.wo.relativenumber=true
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
-- require("menu").open(options, opts)
vim.schedule(function()
  require "mappings"
end)
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config {
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  }
end)

-- Убирает баг с коронами. Вместо них ставит квадраты. Изначально выключены
isLspDiagnosticsVisible = not isLspDiagnosticsVisible
vim.diagnostic.config {
  virtual_text = isLspDiagnosticsVisible,
  underline = isLspDiagnosticsVisible,
}
isLspDiagnosticsVisible = not isLspDiagnosticsVisible
vim.diagnostic.config {
  virtual_text = isLspDiagnosticsVisible,
  underline = isLspDiagnosticsVisible,
}

--
-- check it
-- https://www.reddit.com/r/neovim/comments/16ji91p/how_to_change_the_diagnostics_icons/
-- https://samuellawrentz.com/hacks/neovim/disable-annoying-eslint-lsp-server-and-hide-virtual-text/#:~:text=With%20the%20straightforward%20command%20%3Cleader,annoyance%20of%20continuously%20highlighted%20errors.
