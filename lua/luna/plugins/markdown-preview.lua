return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		-- build = "cd app && yarn install",
		build = ":call mkdp#util#install()",
		lazy = false,
		enable = true,
		ft = { "markdown" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
}
