return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = true,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").gopls.setup({})
			-- require("lspconfig").pyright.setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				myformatter = {
					command = "csharpier",
					args = {
						"format",
						"--write-stdout",
					},
					stdin = true,
				},
			},
			format_on_save = {
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				hcl = { "terraform_fmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				sh = { "shfmt" },
				cs = { "myformatter" },
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)
			vim.api.nvim_create_autocmd("bufwritepre", {
				pattern = "*",
				callback = function(args)
					conform.format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
