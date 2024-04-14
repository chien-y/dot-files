vim.cmd("let g:netrw_liststyle=3")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "lua", "c" },
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- line wrapping
opt.wrap = false
opt.linebreak = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case-sensitive if we include mixed case in search

-- cursor line
opt.cursorline = true -- highlight current cusor line

-- appearance
-- turn on termuicolors for nightfly colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start"
-- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipborad as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.iskeyword:append("-")

-- add spell dictionary
opt.spellfile = vim.fn.stdpath("config") .. "/lua/spell/en.utf-8.add"

-- disable continuation of comment to new lines by 'o'
-- continue comment by hitting <Enter>: r
vim.cmd([[
    autocmd FileType * set formatoptions-=o
]])
