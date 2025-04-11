return {
	"yorickpeterse/nvim-window",
	keys = {
		{ "<leader>wp", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
	},
	opts = {
		chars = {
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
		},

		-- A group to use for overwriting the Normal highlight group in the floating
		-- window. This can be used to change the background color.
		normal_hl = "WindowHint",

		-- The highlight group to apply to the line that contains the hint characters.
		-- This is used to make them stand out more.
		hint_hl = "Bold",

		-- The border style to use for the floating window.
		border = "",

		-- How the hints should be rendered. The possible values are:
		--
		-- - "float" (default): renders the hints using floating windows
		-- - "status": renders the hints to a string and calls `redrawstatus`,
		--   allowing you to show the hints in a status or winbar line
		render = "float",
	},
}
