return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "bash-debug-adapter",
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "prettier",
        "rust-analyzer",
        "stylua",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    actions = {
      expand_all = {
        exclude = { ".git", "target" },
      },
    },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "dockerfile",
        "gitcommit",
        "git_rebase",
        "go",
        "gomod",
        "gomod",
        "java",
        "json",
        "lua",
        "make",
        "markdown",
        "python",
        "rust",
        "vim",
        "vimdoc",
      },
    },
  },

  -- Adds support to lua-language-server for init.lua
  -- and plugin development
  -- Some other setup in ../configs/lspconfig.lua
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- TODO:
  -- https://github.com/NvChad/NvChad/issues/625
  -- https://www.youtube.com/watch?v=Ul_WPhS2bis
  -- {
  --   "mfussenegger/nvim-dap",
  --   opts = {},
  -- },
  --
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "nvim-neotest/nvim-nio",
  --   },
  -- },
}
