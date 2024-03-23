return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.g.nord_contrast = true
		vim.cmd([[ colorscheme catppuccin-mocha ]])
		vim.cmd("highlight SpecialKey guifg=#ffffff")
	end,
}
