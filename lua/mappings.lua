require "nvchad.mappings"
local conform = require "conform"

-- add yours here
-- чтоб dev tools Spring работал
local map = vim.keymap.set

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.java", "*.jsp" },
  callback = function()
    vim.cmd "JavaBuildBuildWorkSpace"
  end,
})

require "configs.smooth_scrolling"
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "ww", "<ESC>")
map("i", "jj", "<ESC>")
vim.keymap.set("n", "<Leader>gi", function()
  vim.lsp.buf.implementation()
end, { desc = "go to implementation" })

vim.keymap.set("n", "<Leader>gD", function()
  vim.lsp.buf.declaration()
end, { desc = "go to Declaration" })
vim.keymap.set("n", "<Leader>gd", function()
  vim.lsp.buf.definition()
end, { desc = "go to definition" })

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
vim.keymap.set({ "n", "v" }, "<leader>l", function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end)
vim.keymap.set({ "n", "v" }, "<leader>ll", function()
  require("lint").try_lint()
end, { desc = "try lint" })
vim.keymap.set("n", "<leader>co", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.organizeImports" } },
    apply = true,
  }
end, { desc = "organizeImports" })

vim.keymap.set("n", "<leader>cg", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.generate" } },
  }
end, { desc = "generate" })
vim.keymap.set("n", "<leader>cm", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.overrideMethods" } },
  }
end, { desc = "override methods" })

vim.keymap.set("n", "<leader>cl", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.generate.accessors" } },
  }
end, { desc = "accessors" })

vim.api.nvim_set_keymap("n", "<leader>k", ":setlocal spell spelllang=en_us<CR>", { noremap = true, silent = true })
