return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
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
        "bash",
        "c",
        "diff",
        "dockerfile",
        "gitattributes",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "haskell",
        "helm",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "proto",
        "python",
        "query",
        "terraform",
        "vim",
        "vimdoc",
        "yaml",
  		},
  	},
  },
}
