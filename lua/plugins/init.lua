return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local dash_board_settings = require("dashboard").setup {
        theme = "hyper",
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "williamboman/mason.nvim",

    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "cpplint",
        "rust-analyzer",
        "typescript-language-server",
      },
    registries = {
      'github:nvim-java/mason-registry', --нужны для устаноки спец пакетов для Java
      'github:mason-org/mason-registry',
    },
    },
  },
--   {
--     -- Install markdown preview, use npx if available.
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     ft = { "markdown" },
--     build = function(plugin)
--       if vim.fn.executable "npx" then
--         vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
--       else
--         vim.cmd [[Lazy load markdown-preview.nvim]]
--         vim.fn["mkdp#util#install"]()
--       end
--     end,
--     init = function()
--       if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
--     end,
--   },
-- {
--     'MeanderingProgrammer/render-markdown.nvim',
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--     ---@module 'render-markdown'
--     ---@type render.md.UserConfig
--     opts = {},
--     ft = {"markdown"},
-- },
{
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
        'ibhagwan/fzf-lua',
        'echasnovski/mini.pick',
    },
    lazy = false,

},
{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- СКАЧАЙ САМ fzf через apt...
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
  lazy = false,
},
    {
  "tpope/vim-fugitive",
  lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
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
"nvim-lua/plenary.nvim",
    lazy = false,
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
    config = function()
      require "configs.debuggers.debugger_cpp"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require('java').setup()
      require "configs.lspconfig"

    end,
  },
  {
    "stevearc/dressing.nvim",

    lazy = false,
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",

    opts = {},

  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require "configs.linter"
    end,
  },
{
  "utilyre/barbecue.nvim", --вернхняя полоска как в vs code
  name = "barbecue",
  lazy = false,
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
},
  -- lazy.nvim
{
  "folke/noice.nvim", --notification IMBA!!!!
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
{'nvim-java/nvim-java'}, --плагин для работы Java
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "cpp",
        "c",
        "java",
        "python",
        "rust",
      },
    },
  },
}
