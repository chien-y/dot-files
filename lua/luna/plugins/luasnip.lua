return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	-- lazy = false,
	dependencies = { "hrsh7th/nvim-cmp", "rafamadriz/friendly-snippets" },

	conf = function()
		local ls = require("luasnip")
		local keymap = vim.keymap
		local types = require("luasnip.util.types")

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/luna/LuaSnip" })

		ls.config.set_config({
			history = true, --keep around last snippet local to jump back
			updateevents = "TextChanged,TextChangedI", --update changes as you type
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "GruvboxOrange" } },
					},
				},
				-- [types.insertNode] = {
				-- 	active = {
				-- 		virt_text = { { "●", "GruvboxBlue" } },
				-- 	},
				-- },
			},
		})

		keymap.set("i", "<Tab>", function()
			ls.expand()
		end, { silent = true, desc = "luasnip expanding" })

		keymap.set({ "i", "s" }, "<Tab>", function()
			ls.jump(1)
		end, { silent = true, desc = "luasnip jumping forward" })

		keymap.set({ "i", "s" }, "<S-Tab>", function()
			ls.jump(-1)
		end, { silent = true, desc = "luasnip jumping backward" })

		keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true, desc = "luasnip: changing choice in choice set" })

		ls.filetype_extend("python", { "pydoc" })
	end,
}
