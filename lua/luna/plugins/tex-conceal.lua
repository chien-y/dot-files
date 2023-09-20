return {
	"KeitaNakamura/tex-conceal.vim",
	filetye = { "tex" },
	config = function()
		vim.opt.conceallevel = 2
		vim.g.tex_conceal = "abdgm"
	end,
}
