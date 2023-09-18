return {
	"rebelot/kanagawa.nvim",
	-- "folke/tokyonight.nvim",
	-- "bluz71/vim-nightfly-guicolors",
	-- "bluz71/vim-moonfly-colors",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme
		vim.cmd([[colorscheme kanagawa-wave]])
		-- vim.cmd([[colorscheme moonfly]])
		-- vim.cmd([[colorscheme tokyonight-moon]])
	end,
}
