return {
	"pocco81/true-zen.nvim",
	config = function()
		local truezen = require("true-zen")

		truezen.setup({
			modes = { -- configurations per mode
				ataraxis = {
					shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
					backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
					minimum_writing_area = { -- minimum size of main window
						width = 90,
						height = 44,
					},
					quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
					padding = { -- padding windows
						left = 30,
						right = 30,
						top = 0,
						bottom = 0,
					},
					callbacks = { -- run functions when opening/closing Ataraxis mode
						open_pre = nil,
						open_pos = nil,
						close_pre = nil,
						close_pos = nil,
					},
				},
			},
		})
	end,
}
