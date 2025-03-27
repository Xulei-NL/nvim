require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.wo.wrap = true
vim.wo.linebreak = true
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.o.guifont = "0xProto Nerd Font:h18"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "hcl, terraform",
	callback = function()
		vim.bo.commentstring = "# %s"
	end,
})
