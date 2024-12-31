return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				normal = "gs",
				visual = "gS",
				change = "gcs",
				delete = "gds",
			},
		})
	end,
}
