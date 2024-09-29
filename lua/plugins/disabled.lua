return {
	{
		"AstroNvim/astrocore",
		---@param opts AstroCoreOpts
		opts = function(_, opts)
			if vim.tbl_get(opts, "options", "opt", "showtabline") then
				opts.options.opt.showtabline = nil
			end
			for k, _ in pairs(opts.mappings.n) do
				if k:find("^<Leader>b") then
					opts.mappings.n[k] = false
				end
			end
		end,
	},
	{
		"AstroNvim/astrocore",
		-- @param opts AstroCoreOpts
		opts = {
			options = {
				opt = {
					showtabline = 0,
				},
			},
		},
	},
	{
		"rebelot/heirline.nvim",
		enabled = false,
		-- opts = function(_, opts)
		-- 	opts.tabline = nil -- remove tabline
		-- end,
	},
	{
		"AstroNvim/astrotheme",
		enabled = false,
	},
}
