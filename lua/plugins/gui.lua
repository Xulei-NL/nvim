return {
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local builtin = require("telescope.builtin")
	-- 		-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
	-- 		-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
	-- 		-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
	-- 		-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	-- 	end,
	-- 	enabled = false,
	-- },
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
		config = function()
			local fzf_lua = require("fzf-lua")
			vim.keymap.set("n", "<leader>ff", fzf_lua.files, { desc = "FZF: Find Files" })
			vim.keymap.set("n", "<Leader>fg", fzf_lua.live_grep, { desc = "FZF: Live Grep" })
			vim.keymap.set("n", "<Leader>fb", fzf_lua.buffers, { desc = "FZF: Buffers" })
			vim.keymap.set("n", "<Leader>fc", fzf_lua.commands, { desc = "FZF: Neovim Commands" })
		end,
	},
	{
		"stevearc/oil.nvim",
		config = true,
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
		},
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = true,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pick").setup({})
		end,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = "light"
			require("solarized").setup(opts)
			vim.cmd.colorscheme("solarized")
		end,
	},
}
