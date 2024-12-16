require("dap").adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}
require("dap").configurations.cpp = {
  {
    name = "Launch codelldb",
    type = "codelldb", -- Используем тип, который настроен выше
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main", "file")
    end,
    cwd = "${workspaceFolder}", -- Рабочая директория
    stopOnEntry = false, -- Не останавливать выполнение сразу
    args = {}, -- Аргументы для программы
    runInTerminal = true, -- Не запускать в отдельном терминале
    console = "integratedTerminal",
  },
}
