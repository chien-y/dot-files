return {
	"lervag/vimtex",
	-- ft = { "tex", "bib", "markdown", "plaintext" },
	config = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_compiler_progname = "nvr"
		vim.g.maplocalleader = " "
		-- vim.opt.conceallevel = 1
		--
		vim.cmd([[
		 " let g:vimtex_view_method = "zathura"
		 " let g:tex_flavor = "latex"
		 " let g:vimtex_quickfix_mode = 0
		 " let g:vimtex_compiler_progname = "nvr"
         let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
         ]])
	end,
}
