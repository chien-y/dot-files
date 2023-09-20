return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	-- <Tab> jumping forward/expanding a snippet
	-- <shift - Tab> jumping backward
	-- <Ctrl-E> changing the current choice when in a choiceNode
	-- vim.cmd([[
	--    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
	--    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
	--    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
	--    " -1 for jumping backwards.
	--    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
	--
	--    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
	--    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
	--
	--    " For changing choices in choiceNodes (not strictly necessary for a basic setup).
	--    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
	--    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
	--    ]]),
	require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/luna/plugins/LuaSnip" }),
	require("luasnip").setup({
		enable_autosnippets = true,
		store_selection_keys = "<Tab>",
	}),

	conf = function()
		local ls = require("luasnip")
		local keymap = vim.keymap

		-- ls.enable_autosnippets = true
		-- ls.store_selection_keys = "<Tab>"

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
	end,
}
