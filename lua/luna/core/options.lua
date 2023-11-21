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
opt.wrap = true
opt.linebreak = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- add spell dictionary
opt.spellfile = vim.fn.stdpath("config") .. "/lua/spell/en.utf-8.add"

-- disable continuation of comment to new lines by 'o'
-- continue comment by hitting <Enter>: r
vim.cmd([[
    autocmd FileType * set formatoptions-=o
]])
