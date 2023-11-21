-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "L", "$")
keymap.set("n", "H", "^")

-- keymap.set("n", "o", "6<C-e>o")
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "No highlight" }) -- clear search highlight (no highlight)

keymap.set("n", "x", '"_x') -- Do not copy when delete characters

keymap.set("n", "<leader>+", "<C-a>") -- increment numbers
keymap.set("n", "<leader>-", "<C-x>") -- decrement numbers

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- navigate terminals
keymap.set(
  "t",
  "<C-x>",
  vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { desc = "Escape terminal mode" }
)
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Navigate left in terminal" })
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Navigate down in terminal" })
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Navigate up in terminal" })
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Navigate right in terminal" })

--------------------
-- Plugin Keybinds
--------------------

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]r>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

-- c++ compile, compile and excute
keymap.set("n", "<F8>", ":w<CR> :!g++ -Wall -std=c++17 % -o %< <CR>", { silent = true })
keymap.set("n", "<F9>", ":w<CR> :!g++ -Wall -std=c++17 % -o %< && ./%< <CR>", { silent = true })
