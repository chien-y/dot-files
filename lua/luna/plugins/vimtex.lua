return {
	"lervag/vimtex",
	ft = { "tex", "bib", "markdown", "plaintext" },
	config = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_engine = "pdflatex"
		-- vim.g.vimtex_compiler_latexmk_engines = "pdflatex"
		-- vim.g.maplocalleader = ','
	end,
}
