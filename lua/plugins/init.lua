return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local dash_board_settings = require('dashboard').setup {
        theme = 'hyper',
      }
    
    
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
  {
    "williamboman/mason.nvim",

    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",

      },
    },
  },

{
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function ()
    require("configs.debuggers.debugger_cpp")
    end,
      },
  --  {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require("dap").adapters.codelldb = {
  --       type = "server",
  --       port = "${port}",
  --       executable = {
  --         command = "codelldb",
  --         args = { "--port", "${port}" },
  --       },
  --     }
  --     require("dap").configurations.cpp = {
  --       {
  --         name = "Launch codelldb",
  --         type = "codelldb", -- Используем тип, который настроен выше
  --         request = "launch",
  --         program = function()
  --           return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main", "file")
  --         end,
  --         cwd = "${workspaceFolder}", -- Рабочая директория
  --         stopOnEntry = false, -- Не останавливать выполнение сразу
  --         args = {}, -- Аргументы для программы
  --         runInTerminal = true, -- Не запускать в отдельном терминале
  --         console = "integratedTerminal",
  --
  --       },
  --     }
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  }, 
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css","cpp","c","java","python","rust",
  		},
  	},
  },
}
