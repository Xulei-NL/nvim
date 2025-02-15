local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		hcl = { "packer_fmt" },
		terraform = { "terraform_fmt" },
		tf = { "terraform_fmt" },
		["terraform-vars"] = { "terraform_fmt" },
		haskell = { "hindent", "fourmolu" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_fallback = true,
	},
}

return options
