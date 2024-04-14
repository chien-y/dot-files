return {
  "szw/vim-maximizer",
  config = function()
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })
  end,
  -- keys = {
  --   },
  -- },
}
