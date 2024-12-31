return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "┃" },
			delete = { text = "━" },
			changedelete = { text = "‖" },
			untracked = { text = "?" },
		},
	},
	keys = {
		{
			"<leader>gH",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview Hunk Inline",
		},
		{
			"<leader>gl",
			function()
				require("gitsigns").toggle_linehl()
			end,
			desc = "Toggle linehl",
		},
	},
}
