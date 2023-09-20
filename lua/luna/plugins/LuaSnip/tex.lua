-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
--
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end
-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s(
		{ trig = "\\env", snippetType = "autosnippet" },
		fmta(
			[[
                \begin{<>}
                    <>
                \end{<>}
            ]],
			{ i(1), i(2), rep(1) } -- this node repeats insert node i(1)
		)
	),
	-- Greeks
	s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
	s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
	s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
	s({ trig = ";G", snippettype = "autosnippet" }, { t("\\Gamma") }),
	s({ trig = ";d", snippettype = "autosnippet" }, { t("\\delta") }),
	s({ trig = ";D", snippetType = "autosnippet" }, { t("\\Delta") }),
	s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambda") }),
	s({ trig = ";e", snippetType = "autosnippet" }, { t("\\varepsilon") }),
	s({ trig = ";z", snippetType = "autosnippet" }, { t("\\zeta") }),

	s({ trig = "ali*", name = "Align" }, { t({ "\\begin{align*}", "\t" }), i(1), t({ "", "\\end{align*}" }) }),

	-- frac
	s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" }, {
		t("\\frac{"),
		i(1), -- insert node 1
		t("}{"),
		i(2), -- insert node 2
		t("}"),
		{ condition = in_mathzone },
	}),

	s(
		{ trig = "sd", snippetType = "autosnippet", wordTrig = false },
		fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
		{ condition = in_mathzone }
	),
}
