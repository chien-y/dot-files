return {
  "lervag/vimtex",
  lazy = false,
  ft = { "tex", "bib", "markdown", "plaintext" },
  opt = true,
  config = function()
    vim.g.vimtex_view_method = "zathura"
    -- vim.g.latex_view_general_viewer = "okular"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    vim.g.vimtex_quickfix_mode = 0
    -- vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex" }
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_compiler_progname = "nvr"
    -- vim.g.vimtex_view_general_options_latexmk = "--unique"
    vim.g.maplocalleader = " " -- local leader keymap
    -- vim.opt.conceallevel = 1
    --
  end,
}
