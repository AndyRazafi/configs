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
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Hunk",
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
