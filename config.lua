-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- install plugins
lvim.plugins = {
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{
		"ChristianChiarulli/swenv.nvim",
		lazy = true,
	},
	"stevearc/dressing.nvim",
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		build = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"wfxr/minimap.vim",
		lazy = true,
		build = "cargo install --locked code-minimap",
		-- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
		end,
	},
	"dstein64/vim-startuptime",
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			-- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
	{
		"j-morano/buffer_manager.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			-- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
}

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"go",
	"json",
	"lua",
	"markdown",
	"python",
	"terraform",
	"yaml",
	"vimdoc",
	"vim",
	"c",
	"query",
	"markdown_inline",
	"diff",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"gomod",
	"gosum",
}

-- setup builtin plugins
lvim.builtin.dap.active = false
lvim.builtin.bigfile.active = false
lvim.builtin.gitsigns.active = false
lvim.builtin.bufferline.active = false

vim.opt.wrap = true
lvim.colorscheme = "shine"
vim.opt.clipboard = "unnamed,unnamedplus"

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		terraform = { "terraform_fmt" },
		tf = { "terraform_fmt" },
		["terraform-vars"] = { "terraform_fmt" },
		json = { "jq" },
		yaml = { "yq" },
		go = { "gofmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local opts = { noremap = true }
local map = vim.keymap.set
-- Setup
require("buffer_manager").setup({
	select_menu_item_commands = {
		v = {
			key = "<C-v>",
			command = "vsplit",
		},
		h = {
			key = "<C-h>",
			command = "split",
		},
	},
	focus_alternate_buffer = false,
	short_file_names = true,
	short_term_names = true,
	loop_nav = false,
	highlight = "Normal:BufferManagerBorder",
	win_extra_options = {
		winhighlight = "Normal:BufferManagerNormal",
	},
})
-- Navigate buffers bypassing the menu
local bmui = require("buffer_manager.ui")
local keys = "1234567890"
for i = 1, #keys do
	local key = keys:sub(i, i)
	map("n", string.format("<leader>%s", key), function()
		bmui.nav_file(i)
	end, opts)
end
-- Just the menu
map({ "t", "n" }, "<leader>fb", bmui.toggle_quick_menu, opts)
-- Open menu and search
map({ "t", "n" }, "<M-m>", function()
	bmui.toggle_quick_menu()
	-- wait for the menu to open
	vim.defer_fn(function()
		vim.fn.feedkeys("/")
	end, 50)
end, opts)
