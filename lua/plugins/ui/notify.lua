return {
	"rcarriga/nvim-notify",
	opts = {
		render = "wrapped-compact",
		stages = "fade",
		popup = {
			focusable = false,
		},
	},
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss()
			end,
			desc = "Dismiss notifications",
		},
	},
}
