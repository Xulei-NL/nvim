-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"bash",
			"json",
			"jsonc",
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

			"gitattributes",
			"gitcommit",
			"gitignore",
			"git_config",
			"git_rebase",

			"go",
			"gomod",
			"gosum",
			"gotmpl",
			"gowork",
			"helm",
			-- add more arguments for adding more treesitter parsers
		},
	},
}
