return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	version = "*",
	opts = {
		direction = "horizontal",
		size = 10,
	},
	keys = {
		{ "<leader>t", "<CMD> ToggleTerm <CR>", desc = "ToggleTerm" },
	},
}
