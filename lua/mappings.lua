require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "ww", "<ESC>")
map("i", "jj", "<ESC>")
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F2>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F6>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F7>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)

vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

