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
