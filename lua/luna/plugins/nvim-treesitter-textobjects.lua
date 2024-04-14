return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = { "bufreadpost", "bufnewfile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,

          -- automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- you can use the capture groups defined in textobjects.scm
            ["a="] = { query = "@assignment.outer", desc = "select outer part of an assignment region" },
            ["i="] = { query = "@assignment.inner", desc = "select inner part of an assignment region" },

            ["a:"] = { query = "@parameter.outer", desc = "select outer part of a parameter/field region" },
            ["i:"] = { query = "@parameter.inner", desc = "select inner part of a parameter/field region" },

            ["ai"] = { query = "@conditional.outer", desc = "select outer part of a conditional region" },
            ["ii"] = { query = "@conditional.inner", desc = "select inner part of a conditional region" },

            ["al"] = { query = "@loop.outer", desc = "select outer part of a loop region" },
            ["il"] = { query = "@loop.inner", desc = "select inner part of a loop region" },

            ["ab"] = { query = "@block.outer", desc = "select outer part of a block region" }, -- overrides default text object block of parenthesis to parenthesis
            ["ib"] = { query = "@block.inner", desc = "select inner part of a block region" }, -- overrides default text object block of parenthesis to parenthesis

            ["af"] = { query = "@function.outer", desc = "select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "select inner part of a function region" },

            ["ac"] = { query = "@class.outer", desc = "select outer part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },
          },
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
          },
          swap_previous = {
            ["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
          },
        },
      },
    })
  end,
}
